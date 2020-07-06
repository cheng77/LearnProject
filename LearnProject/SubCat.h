//
//  SubCat.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/3.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "Cat.h"

NS_ASSUME_NONNULL_BEGIN

@interface SubCat : Cat

/** name */
@property(nonatomic,readwrite,copy)  NSString *name;
+ (void) sing;

- (void)run;
@end

NS_ASSUME_NONNULL_END
