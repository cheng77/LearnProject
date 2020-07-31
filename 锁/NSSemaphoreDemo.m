//
//  NSSemaphoreDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/31.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "NSSemaphoreDemo.h"
#define kSemaphornBegin \
static dispatch_semaphore_t semaphore;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
    semaphore = dispatch_semaphore_create(1);\
});\
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define kSemaphornBeginWithCount(count) \
static dispatch_semaphore_t semaphore;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
    semaphore = dispatch_semaphore_create(count);\
});\
dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

#define kSemaphornEnd   dispatch_semaphore_signal(semaphore);

@interface NSSemaphoreDemo ()
/** 信号量 */
@property(nonatomic,strong) dispatch_semaphore_t sem;
@end

@implementation NSSemaphoreDemo
- (instancetype)init{
    if (self = [super init]) {
        self.sem = dispatch_semaphore_create(5);
    }
    return self;
}

- (void)othreTest{
    for (NSInteger i = 0; i < 10; i++) {
       [[[NSThread alloc] initWithTarget:self selector:@selector(__test) object:nil] start];
    }
}

- (void)__test{
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
    NSLog(@"任务:%@",[NSThread currentThread]);
    sleep(2);
    dispatch_semaphore_signal(self.sem);
}
/**
 小技巧
 */
- (void)__test2{
    kSemaphornBeginWithCount(1);
    //代码
    kSemaphornEnd;
}
@end
