//
//  NSObject+XNAdd.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/7.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "NSObject+XNAdd.h"
#import <objc/runtime.h>
@implementation NSObject (XNAdd)
+ (instancetype)xn_objectWithJsonDictonary:(NSDictionary*)jsonDictonary{
    id objc = [[self alloc] init];
    
    //开始转换
    unsigned int count;
    Ivar* list = class_copyIvarList([self class], &count);
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = list[i];
        NSString* name =  [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSMutableString* newProperty = [NSMutableString stringWithFormat:@"%@",name];
        [newProperty deleteCharactersInRange:NSMakeRange(0, 1)];
        
        [objc setValue:jsonDictonary[newProperty] forKey:newProperty];
    }
    free(list);
    return objc;
}
@end
