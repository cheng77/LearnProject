//
//  NSLockDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
@property(nonatomic,readwrite,strong)  NSLock* lock;

@property(nonatomic,readwrite,strong)  NSLock* lock1;
@end

@implementation NSLockDemo


- (instancetype)init{
    if (self = [super init]) {
        self.lock = [[NSLock alloc] init];
        self.lock1 = [[NSLock alloc] init];
    }
    return self;
}

//卖票
- (void)saveTickets{
    [self.lock lock];
    [super saveTickets];
    //如果不解锁 就会产生 死锁
    [self.lock unlock];
}

//取钱
- (void)fetchMoney{
    [self.lock1 lock];
    [super fetchMoney];
    [self.lock1 unlock];
}

//存钱
- (void)saveMoney{
    [self.lock1 lock];
    [super saveMoney];
    [self.lock1 unlock];
}

@end
