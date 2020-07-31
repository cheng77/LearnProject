//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNBaseDemo.h"
#import "OSSpinLockDemo.h"
#import "OSUnfairDemo.h"
#import "MutexDemo.h"
#import "MutexDemo2.h"//死锁现象
#import "MutexDemo3.h"//条件锁
#import "NSLockDemo.h"// 可以理解为对Mutex 常规锁 OC封装
#import "NSConditionDemo.h" // 可以理解为对Mutex和con 递归锁 OC封装
#import "XNConditonLockDemo.h"//对Condition锁的封装
#import "NSSemaphoreDemo.h"//信号量
#import "SynchronizedDemo.h"// 对 mutex 递归锁 封装
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    XNBaseDemo * demo = [[SynchronizedDemo alloc] init];
//    [demo othreTest];
    [demo saveMoneyDemo];
    [demo saleTicketsDemo];
}


@end
