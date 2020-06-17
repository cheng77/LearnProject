//
//  XNPerson+Test02.m
//  LearnProject
//
//  Created by CXN on 2020/6/16.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNPerson+Test02.h"

@implementation XNPerson (Test02)
- (void)run{
    NSLog(@"调用分类Test02的run方法");
}

+ (void)load{
    NSLog(@"调用Test02+load方法");
}

+(void)initialize{
    NSLog(@"调用:Test02 initialize方法");
}

@end
