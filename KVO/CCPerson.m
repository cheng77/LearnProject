//
//  CCPerson.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "CCPerson.h"

@implementation CCPerson
{
    int height;
    
    

//    int _height; //第1个赋值
//    int _isHeight; //第2个赋值
//    int height; //第3个赋值
//    int isHeight; //第4个赋值
}

#pragma mark - 首先 - 调用1
//- (void) setHeight:(int)height{
//    NSLog(@"setHeight:height");
//}

#pragma mark - 其次 - 调用2
//- (void)_setHeight:(int)height{
//    NSLog(@"_setHeight:height");
//}

#pragma mark - 其次 - 调用3
//默认返回的YES
+ (BOOL)accessInstanceVariablesDirectly{

    NSLog(@"方法:accessInstanceVariablesDirectly");
    /**
     * 返回NO 抛出异常
     *  Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<CCPerson 0x6000029069e0> valueForUndefinedKey:]: this class is not key value coding-compliant for the key height
     */
    
//    return NO;
    
    /**
     返回YES. 程序会按照以下顺序 对成员变量进行赋值操作.
     访问顺序:_key , _isKey, key, isKey.
     例如:
     int _height; //第1个赋值
     int _isHeight; //第2个赋值
     int height; //第3个赋值
     int isHeight; //第4个赋值
     
     */
    return YES;

}

- (void)willChangeValueForKey:(NSString *)key{
    [super willChangeValueForKey:key];
    NSLog(@"来了");
}

- (void)didChangeValueForKey:(NSString *)key{
    [super didChangeValueForKey:key];
    NSLog(@"走了");
}

@end
