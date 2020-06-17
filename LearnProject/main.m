//
//  main.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XNPerson.h"
#import "XNPerson+Test01.h"
#import "XNPerson+Test02.h"
#import "Son.h"
int main(int argc, char * argv[]) {
    XNPerson * person = [[XNPerson alloc] init];
    [person run];
    
    Son * son = [[Son alloc] init];
    
    /*
     *
     load 方法会在加载类,分类时候调用
     调用顺序
     1 先调用类的load方法
        1.1 先编译先调用
        1.2 调用子类的load方法之前,先调用父类的load方法
     2 再调用分类的load方法
        先编译先调用
     initialize 方法会在给类第一次发送消息时候调用
     1 先调用分类
        先编译后调用
     2 再调用类
        子类有直接调
     
     load方法是程序直接调用,initialize 走的是消息发送
     */
    
}
/*
 NSString * appDelegateClassName;
 @autoreleasepool {
     // Setup code that might create autoreleased objects goes here.
     appDelegateClassName = NSStringFromClass([AppDelegate class]);
 }
 return UIApplicationMain(argc, argv, nil, appDelegateClassName);
 */
