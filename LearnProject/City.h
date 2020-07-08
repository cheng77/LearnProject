//
//  City.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/7.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject
/** 城市名 */
@property(nonatomic,readwrite,copy)  NSString *name;
/** 城市地址 */
@property(nonatomic,readwrite,copy)  NSString *address;
@end

NS_ASSUME_NONNULL_END
