//
//  OSSpinLockDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>
@interface OSSpinLockDemo ()
/** 自旋锁 */
@property(nonatomic,readwrite,assign) OSSpinLock lock;
@property(nonatomic,readwrite,assign) OSSpinLock lock2;
@end
@implementation OSSpinLockDemo
- (instancetype)init{
    if (self = [super init]) {
        self.lock = OS_SPINLOCK_INIT;
        self.lock2 = OS_SPINLOCK_INIT;
    }
    return self;
}

//卖票
- (void)saveTickets{
    OSSpinLockLock(&_lock);
    [super saveTickets];
    OSSpinLockUnlock(&_lock);
}

//取钱
- (void)fetchMoney{
    OSSpinLockLock(&_lock2);
    [super fetchMoney];
    OSSpinLockUnlock(&_lock2);
}

//存钱
- (void)saveMoney{
    OSSpinLockLock(&_lock2);
    [super saveMoney];
    OSSpinLockUnlock(&_lock2);
}
@end
