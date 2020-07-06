//
//  main.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

void test(){//局部变量 内存地址 从高低分配
    int a = 0;
    int b = 1;
    int c = 2;
    int d = 3;
    NSLog(@"%p %p %p %p", &a, &b, &c, &d);
}

struct Num {//量 内存地址 从低到高分配
    int a;
    int b;
    int c;
    int d;
};

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        test();
        // Setup code that might create autoreleased objects goes here.
//        struct Num page = {1,2,3,4};
//
//        NSLog(@"%p %p %p %p", page.a, page.b, page.c, page.d);
        
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
