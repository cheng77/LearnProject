//
//  NSConditionDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "NSConditionDemo.h"
@interface NSConditionDemo ()
/** 条件 */
@property(nonatomic,readwrite,strong)  NSCondition* condation;
/** 数组 */
@property(nonatomic,readwrite,strong)  NSMutableArray *data;

@end
@implementation NSConditionDemo
- (instancetype)init{
    if (self = [super init]) {
        self.condation = [[NSCondition alloc] init];
        self.condation.name = @"aaa";
    }
    return self;
}

- (void)othreTest{
    for (NSInteger i = 0; i < 5; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
        [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    }
    
}

- (void)__remove{
    [self.condation lock];
    if (self.data.count == 0) {
        //线程等待中 会释放lock锁 ,当被唤醒时会加锁
        [self.condation wait];
    }
    [self.data removeLastObject];
    NSLog(@"移除元素:%@",[NSThread currentThread]);
    
   [self.condation unlock];
}

- (void)__add{
    [self.condation lock];
    [self.data addObject:@"Test"];
    //唤醒等待的线程
//    [self.condation signal];
    //广播的形式唤醒等待的所有线程
    [self.condation broadcast];
    NSLog(@"添加元素%@",[NSThread currentThread]);
    [self.condation unlock];
}
- (void)otherTest2{
 
}

@end
