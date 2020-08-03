//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNTimer.h"
@interface ViewController ()
/** timer */
@property(nonatomic,readwrite,strong)  dispatch_source_t timer;

/** 任务名称 */
@property(nonatomic,readwrite,copy)  NSString *name;
@end

@implementation ViewController

void fire(void*param){
   NSLog(@"调用%@",[NSThread currentThread]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.name =  [XNTimer doTask:^{
        NSLog(@"---%@",[NSThread currentThread]);
    } startTime:1 timeInterval:2 repeats:YES async:NO];
   
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [XNTimer cancelTask:self.name];
}

- (void)demo{
        dispatch_queue_t que = dispatch_queue_create("com.my.queue", DISPATCH_QUEUE_SERIAL);
        //时间非常准确 底层是和系统内核挂钩 不牵扯RunLoop
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, que);
        //dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 开始时间 * NSEC_PER_SEC, 间隔 * NSEC_PER_SEC);
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 2 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(timer, ^{
            NSLog(@"调用%@",[NSThread currentThread]);
        });
    //    dispatch_source_set_event_handler_f(timer, fire);
        dispatch_resume(timer);
        
        self.timer = timer;
}
@end
