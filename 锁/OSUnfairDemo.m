//
//  OSUnfairDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "OSUnfairDemo.h"
#import <os/lock.h>
@interface OSUnfairDemo ()
/** 锁 */
@property(nonatomic,readwrite,assign)  os_unfair_lock lock;
@property(nonatomic,readwrite,assign)  os_unfair_lock lock1;
@end
@implementation OSUnfairDemo

- (instancetype)init{
    if (self = [super init]) {
        self.lock = OS_UNFAIR_LOCK_INIT;
        self.lock1 = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

//卖票
- (void)saveTickets{
    os_unfair_lock_lock(&_lock);
    [super saveTickets];
    //如果不解锁 就会产生 死锁
    os_unfair_lock_unlock(&_lock);
    
}

//取钱
- (void)fetchMoney{
    os_unfair_lock_lock(&_lock1);
    [super fetchMoney];
    os_unfair_lock_unlock(&_lock1);
}

//存钱
- (void)saveMoney{
    os_unfair_lock_lock(&_lock1);
    [super saveMoney];
    os_unfair_lock_unlock(&_lock1);
}
@end
