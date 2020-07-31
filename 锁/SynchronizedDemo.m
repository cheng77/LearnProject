//
//  SynchronizedDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/31.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "SynchronizedDemo.h"

@implementation SynchronizedDemo
- (void)othreTest{
}



- (void)saveTickets{
    static NSObject* lock;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        lock = [[NSObject alloc]init];
    });
    
    @synchronized (lock) {
        [super saveTickets];
    }
}


- (void)saveMoney{
    @synchronized (self) {
       [super saveMoney];
    }
}

- (void)fetchMoney{
    @synchronized (self) {
        [super fetchMoney];
    }
}

@end
