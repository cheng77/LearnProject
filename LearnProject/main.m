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

int main(int argc, char * argv[]) {
    XNPerson * person = [[XNPerson alloc] init];
    [person run];
}
/*
 NSString * appDelegateClassName;
 @autoreleasepool {
     // Setup code that might create autoreleased objects goes here.
     appDelegateClassName = NSStringFromClass([AppDelegate class]);
 }
 return UIApplicationMain(argc, argv, nil, appDelegateClassName);
 */
