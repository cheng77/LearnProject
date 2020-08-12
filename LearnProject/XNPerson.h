//
//  XNPerson.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/12.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject
/** 小狗 */
@property(nonatomic,readwrite,retain)  Dog *dog;
/** name */
@property(nonatomic,readwrite,copy)  NSString *name;
@property(nonatomic,readwrite,retain)NSMutableArray* data;
@end

NS_ASSUME_NONNULL_END
