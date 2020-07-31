//
//  XNBaseDemo.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNBaseDemo : NSObject

/**
卖票演示
*/
- (void)saleTicketsDemo;

/*
 * 存钱,取钱
 */
- (void)saveMoneyDemo;

//卖票
- (void)saveTickets;

//取钱
- (void)fetchMoney;

//存钱
- (void)saveMoney;

- (void)othreTest;
@end

NS_ASSUME_NONNULL_END
