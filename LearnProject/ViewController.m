//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import <libkern/OSAtomic.h>
@interface ViewController ()
/** 票数 */
@property(nonatomic,readwrite,assign) int ticketsCounts;
/** 钱数 */
@property(nonatomic,readwrite,assign) int money;
/*
 * 自旋锁 忙等 一直占用CPU资源 目前已经不安全 可能会出现优先级翻转
 * 时间片轮转调度算法 (进程 线程)
 * 线程优先级
  如果等待锁的线程优先级比较高,它会一直占用CPU资源,优先级低的线程就无法释放锁
 */
@property(nonatomic,readwrite,assign) OSSpinLock lock;
@property(nonatomic,readwrite,assign) OSSpinLock lock2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lock = OS_SPINLOCK_INIT;
    self.lock2 = OS_SPINLOCK_INIT;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self saleTicketsDemo];
//    [self saveMoneyDemo];
}

#pragma mark -------多线程技术
- (void)demo{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1");
        //这句话本质是在runloop中添加定时器 子线程默认是开启runloop
        [self performSelector:@selector(test) withObject:nil afterDelay:.0];
        NSLog(@"3");
        
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] run];
    });
}

- (void)demo2{
    NSThread * thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1");
//        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
//        [[NSRunLoop currentRunLoop] run];
    }];
    [thread start];
    //target thread exited while waiting for the perform
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
    
}

- (void)demo3{
    dispatch_queue_t queue = dispatch_queue_create("com.my.queue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0;i < 4 ; i++) {
            NSLog(@"任务1---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0;i < 4 ; i++) {
            NSLog(@"任务2---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (NSInteger i = 0;i < 4 ; i++) {
           NSLog(@"任务3---%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (NSInteger i = 0;i < 4 ; i++) {
           NSLog(@"任务4---%@",[NSThread currentThread]);
        }
    });
    
}
- (void)test{
    NSLog(@"2");
}

#pragma mark -------安全隐患

/**
卖票演示
*/
- (void)saleTicketsDemo{
    self.ticketsCounts = 100;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSInteger i = 0;i < 20 ; i++) {
            [self saveTickets];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSInteger i = 0;i < 20 ; i++) {
            [self saveTickets];
        }
    });
    
}
- (void)saveTickets{
//    OSSpinLockLock(&_lock2);
    if (OSSpinLockTry(&_lock2)) {
        int oldTickets = self.ticketsCounts;
        sleep(.3);
        oldTickets -= 1;
        self.ticketsCounts = oldTickets;
        NSLog(@"剩余票数:%d",self.ticketsCounts);
        OSSpinLockUnlock(&_lock2);
    }
    
}


/*
 * 存钱,取钱
 */
- (void)saveMoneyDemo{
    self.money = 300;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSInteger i = 0;i < 20; i++) {
            [self fetchMoney];
        }
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (NSInteger i = 0;i < 20; i++) {
            [self saveMoney];
        }
    });
}
- (void)fetchMoney{
    OSSpinLockLock(&_lock);
    int currentMoney = self.money;
    sleep(0.5);
    currentMoney = currentMoney-10;
    self.money = currentMoney;
    NSLog(@"取出剩余:%d",self.money);
    OSSpinLockUnlock(&_lock);
}

- (void)saveMoney{
    OSSpinLockLock(&_lock);
    int currentMoney = self.money;
    sleep(0.5);
    currentMoney = currentMoney+10;
    self.money = currentMoney;
    NSLog(@"存入剩余:%d",self.money);
    OSSpinLockUnlock(&_lock);
}
@end
