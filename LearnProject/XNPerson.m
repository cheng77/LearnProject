//
//  XNPerson.m
//  LearnProject
//
//  Created by CXN on 2020/6/16.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNPerson.h"

@implementation XNPerson
- (void)run{
    NSLog(@"调用XNPerson的run方法");
}

+(void)load{
    NSLog(@"调用:XNPerson load方法");
}

+(void)initialize{
    NSLog(@"调用:XNPerson initialize方法");
}
@end
