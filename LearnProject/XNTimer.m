//
//  XNTimer.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/3.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNTimer.h"
@interface XNTimer ()
/** 任务名称 */
@property(nonatomic,readwrite,copy)  NSString *name;
@end
@implementation XNTimer


static NSMutableDictionary * timers_;
dispatch_semaphore_t semaphore_;

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timers_ = [[NSMutableDictionary alloc] init];
        semaphore_ = dispatch_semaphore_create(1);
    });
}

+ (NSString*)doTask:(Task)task
          startTime:(NSTimeInterval)startTime
       timeInterval:(NSTimeInterval)timeInterval
            repeats:(BOOL)repeats
              async:(BOOL)async{
    
    if (!task || startTime < 0 || (timeInterval <= 0 && repeats)) return nil;
    
    dispatch_queue_t que = async ? dispatch_get_global_queue(0, 0) : dispatch_get_main_queue();
    
    //时间非常准确 底层是和系统内核挂钩 不牵扯RunLoop
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, que);
    //dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 开始时间 * NSEC_PER_SEC, 间隔 * NSEC_PER_SEC);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, startTime * NSEC_PER_SEC, timeInterval * NSEC_PER_SEC);
    
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    NSString * name = [NSString stringWithFormat:@"%zd",timers_.count];
    timers_[name] = timer;
    dispatch_semaphore_signal(semaphore_);
    
    dispatch_source_set_event_handler(timer, ^{
        task();
        //取消操作
        if (!repeats) {
            [self cancelTask:name];
        }
    });
    dispatch_resume(timer);
    
    return name;
}

+ (NSString*)doTaskWithTarget:(id)target
                     selector:(SEL)selector
                    startTime:(NSTimeInterval)startTime
                 timeInterval:(NSTimeInterval)timeInterval
                      repeats:(BOOL)repeats
                        async:(BOOL)async{
    if (!target || !selector) return nil;
    return [self doTask:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [target performSelector:selector];
#pragma clang diagnostic pop
    } startTime:startTime timeInterval:timeInterval repeats:repeats async:async];
}

+ (void)cancelTask:(NSString*)taskName{
    dispatch_semaphore_wait(semaphore_, DISPATCH_TIME_FOREVER);
    dispatch_source_cancel(timers_[taskName]);
    [timers_ removeObjectForKey:taskName];
    dispatch_semaphore_signal(semaphore_);
}

@end
