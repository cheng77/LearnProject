//
//  XNPerson.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/6.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject

/** age */
@property(nonatomic,readwrite,copy)  NSString *age;
- (void)run;
@end

NS_ASSUME_NONNULL_END
