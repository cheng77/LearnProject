//
//  NSObject+XNAdd.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/7.
//  Copyright © 2020 chengning. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XNAdd)
//字典转模型
+ (instancetype)xn_objectWithJsonDictonary:(NSDictionary*)jsonDictonary;
@end

NS_ASSUME_NONNULL_END
