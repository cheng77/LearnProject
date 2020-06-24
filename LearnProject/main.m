//
//  main.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    
//    void (^TestBlock)(void) = ^{
//        NSLog(@"调用");
//        NSLog(@"调用");
//        NSLog(@"调用");
//    };
//    TestBlock();
//
//    void (^TestBlock2)(void) = ^{
//        NSLog(@"调用");
//        NSLog(@"调用");
//        NSLog(@"调用");
//    };
//    TestBlock2();
    
}
