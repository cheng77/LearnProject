//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNThread.h"

@interface ViewController ()
/** 线程 */
@property(nonatomic,readwrite,strong)  XNThread *thread;

/** 停止 */
@property(nonatomic,readwrite,assign) BOOL isStop;
@end

@implementation ViewController

void ObserRunloopCFRunLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
   
    switch (activity) {
        case kCFRunLoopEntry:
        {
            
            CFRunLoopMode model = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
            NSLog(@"kCFRunLoopEntry - %@",model);
            CFRelease(model);
            
        }
            break;
//        case kCFRunLoopBeforeTimers:
//        {
//            NSLog(@"kCFRunLoopBeforeTimers");
//        }
//            break;
//        case kCFRunLoopBeforeSources:
//        {
//            NSLog(@"kCFRunLoopBeforeSources");
//        }
//            break;
//        case kCFRunLoopBeforeWaiting:
//        {
//            NSLog(@"kCFRunLoopBeforeWaiting");
//        }
//            break;
//        case kCFRunLoopAfterWaiting:
//        {
//            NSLog(@"kCFRunLoopAfterWaiting");
//        }
//            break;
        case kCFRunLoopExit:
        {
            CFRunLoopMode model = CFRunLoopCopyCurrentMode(CFRunLoopGetCurrent());
            NSLog(@"kCFRunLoopExit - %@",model);
            CFRelease(model);
        }
            break;
        default:
            break;
    }
};

-(void)dealloc{
    NSLog(@"vc:%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isStop = NO;
    [self demo05];
}

#pragma mark - 应用
#pragma mark - 线程保活
- (void)demo05{
    self.thread= [[XNThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}

- (void)demo04{
    //[01NSTimer 失效]
    static int count = 0;
    NSTimer * timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d",count);
//        NSLog(@"%@",[NSThread currentThread]);
        count++;
    }];
    //NSRunLoopCommonModes 通用模式 并不是一个真的模式 只是一个标记
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [[NSRunLoop currentRunLoop] run];
//    });
}

- (void)demo03{
   CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ObserRunloopCFRunLoopObserverCallBack, NULL);
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
}



- (void)demo01{
    //    NSRunLoop* ocrunloop = [NSRunLoop currentRunLoop];
    //    NSRunLoop* mainrunloop = [NSRunLoop mainRunLoop];
    //
    //    CFRunLoopRef cfrunloop = CFRunLoopGetCurrent();
    //    CFRunLoopRef cfmainrunloop = CFRunLoopGetMain();
    
    //    NSLog(@"%@",ocrunloop);
    //    NSLog(@"--------------");
    //    NSLog(@"%p",mainrunloop);
    //    NSLog(@"--------------");
    //    NSLog(@"%p %p",cfrunloop,cfmainrunloop);
    
    //    kCFRunLoopDefaultMode;
    //    NSDefaultRunLoopMode;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //    NSLog(@"%s",__func__);
//    [NSTimer scheduledTimerWithTimeInterval:3.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"定时器-----------");
//    }];
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
    NSLog(@"继续");
}


- (void)demo02{
    //source0
    //1 触摸事件
    //2 performSelector
    //
    [self performSelector:@selector(run)];
    
    //source1
    //基于Port的线程间通信
    //系统事件捕捉
    
    //Timers
    //NSTime
    //self performSelector: withObject: afterDelay:
    
    //Observers
    //用于监听Runloop状态
    //UI刷新(BeforeWaiting 即将进入休眠)
    //Autorelease pool (BeforeWaiting 即将进入休眠)
    
    [self performSelector:@selector(run) withObject:nil afterDelay:0.2];
    
}

//线程保活
- (void)run{
    NSLog(@"%s",__func__);
    NSLog(@"%@",[NSThread currentThread]);
    //向runloop添加一个source\timer
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
    /**
     换句话说，此方法有效地开始了一个无限循环，该循环处理来自运行循环的输入源和计时器的数据。
     从运行循环中手动删除所有已知的输入源和计时器并不能保证运行循环将退出。macOS可以根据需要安装和删除额外的输入源，以处理针对接收者线程的请求。因此，这些源可以阻止运行循环退出。
     */
//    [[NSRunLoop currentRunLoop] run];
      
    while (!self.isStop) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }
    NSLog(@"End");
}

- (void)stopThread{
    
    CFRunLoopStop(CFRunLoopGetCurrent());
    
}

- (void)stop{
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:NO];
}
- (void)test{
    NSLog(@"干活");
    NSLog(@"%@",[NSThread currentThread]);
}
@end
