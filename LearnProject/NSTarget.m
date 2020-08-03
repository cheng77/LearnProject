//
//  NSTarget.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/1.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "NSTarget.h"

@implementation NSTarget

+ (instancetype)initWithTarget:(id)target{
    NSTarget* nstarget = [[NSTarget alloc]init];
    nstarget.target = target;
    return nstarget;
}
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return self.target;
}
@end
