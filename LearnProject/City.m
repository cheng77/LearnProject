//
//  City.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/7.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "City.h"
#import <objc/runtime.h>
@interface City ()<NSSecureCoding>

@end
@implementation City

- (void)encodeWithCoder:(NSCoder *)coder{
    unsigned int count;
    Ivar* list = class_copyIvarList([self class], &count);
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = list[i];
        NSString* name =  [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSMutableString* newProperty = [NSMutableString stringWithFormat:@"%@",name];
        [newProperty deleteCharactersInRange:NSMakeRange(0, 1)];
        
        id value = [self valueForKey:newProperty];
        [coder encodeObject:value forKey:newProperty];
    }
    free(list);
}

+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) {
        unsigned int count;
        Ivar* list = class_copyIvarList([self class], &count);
        for (NSInteger i = 0; i < count; i++) {
            Ivar ivar = list[i];
            NSString* name =  [NSString stringWithUTF8String:ivar_getName(ivar)];
            NSMutableString* newProperty = [NSMutableString stringWithFormat:@"%@",name];
            [newProperty deleteCharactersInRange:NSMakeRange(0, 1)];
            
            id value = [coder decodeObjectOfClasses:[NSSet setWithObject:[self class]] forKey:newProperty];
            [self setValue:value forKey:newProperty];
        }
        free(list);
    }
    return self;
}
+ (BOOL)supportsSecureCoding{
    return YES;
}
@end
