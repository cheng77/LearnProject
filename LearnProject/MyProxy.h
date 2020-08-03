//
//  MyProxy.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/1.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyProxy : NSProxy
@property(nonatomic,readwrite,weak) id target;
+ (instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
