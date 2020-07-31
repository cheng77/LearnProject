//
//  XNBaseDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNBaseDemo.h"

@interface XNBaseDemo ()
/** 票数 */
@property(nonatomic,readwrite,assign) int ticketsCounts;
/** 钱数 */
@property(nonatomic,readwrite,assign) int money;
@end

@implementation XNBaseDemo
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
    int oldTickets = self.ticketsCounts;
    sleep(.3);
    oldTickets -= 1;
    self.ticketsCounts = oldTickets;
    NSLog(@"剩余票数:%d",self.ticketsCounts);
    
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
    int currentMoney = self.money;
    sleep(0.5);
    currentMoney = currentMoney-10;
    self.money = currentMoney;
    NSLog(@"取出剩余钱数:%d",self.money);
}

- (void)saveMoney{
    int currentMoney = self.money;
    sleep(0.5);
    currentMoney = currentMoney+10;
    self.money = currentMoney;
    NSLog(@"存入剩余钱数:%d",self.money);
}


- (void)othreTest{}
@end
