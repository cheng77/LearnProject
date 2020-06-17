//
//  XNPerson+Test01.m
//  LearnProject
//
//  Created by CXN on 2020/6/16.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNPerson+Test01.h"

@implementation XNPerson (Test01)
/**
 分类的底层数据结构:
 struct _category_t {
     const char *name;
     struct _class_t *cls;
     const struct _method_list_t *instance_methods;
     const struct _method_list_t *class_methods;
     const struct _protocol_list_t *protocols;
     const struct _prop_list_t *properties;
 };
 
 
 */

- (void)run{
    NSLog(@"调用分类Test01的run方法");
}

+ (void)load{
    NSLog(@"调用Test01+load方法");
}

+(void)initialize{
    NSLog(@"调用:Test01 initialize方法");
}

@end
