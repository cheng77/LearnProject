//
//  XNConditonLockDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/30.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNConditonLockDemo.h"

@interface XNConditonLockDemo ()
/** 条件 */
@property(nonatomic,readwrite,strong)  NSConditionLock* condation;
@end


@implementation XNConditonLockDemo

- (instancetype)init{
    if (self = [super init]) {
        self.condation = [[NSConditionLock alloc] initWithCondition:1];
    }
    return self;
}

- (void)othreTest{
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

- (void)__one{
    [self.condation lockWhenCondition:1];
    NSLog(@"__one");
    [self.condation unlockWithCondition:2];
}

- (void)__two{
    [self.condation lockWhenCondition:2];
    NSLog(@"__two");
    [self.condation unlockWithCondition:3];
}

- (void)__three{
    [self.condation lockWhenCondition:3];
    NSLog(@"__three");
    [self.condation unlockWithCondition:0];
}
- (void)otherTest2{
    
}
@end
