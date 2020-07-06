//
//  Son.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/3.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "Son.h"
#import <objc/runtime.h>
@implementation Son

- (instancetype)init{
    if (self = [super init]) {
        NSLog(@"[self class]:%@",[self class]);//Son
        NSLog(@"[self superclass] %@",[self superclass]);//Person

        NSLog(@"[super class]:%p",[super class]);//Son
        NSLog(@"[super superclass]:%p",[super superclass]);//Person
        
        NSLog(@"1 %p",self);
        NSLog(@"2 %p",[Son class]);
        
        NSLog(@"A:%p",object_getClass(self));
    }
    return self;
}

- (void)run{
    [super run];
    
}

//- (Class)class{
//    return object_getClass(self);
//}
//
//- (Class)superclass{
//    return class_getSuperclass(object_getClass(self));
//}
@end
