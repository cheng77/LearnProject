//
//  MutexDemo2.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "MutexDemo2.h"

#import <pthread.h>
@interface MutexDemo2 ()
@property(nonatomic,readwrite,assign)  pthread_mutex_t lock;
@end

@implementation MutexDemo2

- (void)__initMutex:(pthread_mutex_t*)tex{
    //初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    /**
      PTHREAD_MUTEX_RECURSIVE 递归锁
      !!!递归锁 容许 同一个线程 对一把锁进行重复加锁
     */
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);

    //初始化锁
    pthread_mutex_init(tex, &attr);
    //销毁属性
    pthread_mutexattr_destroy(&attr);

}
- (instancetype)init{
    if (self = [super init]) {
        [self __initMutex:&_lock];
    }
    return self;
}

- (void)othreTest{
    pthread_mutex_lock(&_lock);
    NSLog(@"%s",__func__);
//    [self otherTest2];
    static int count = 0;
    if (count < 10) {
        count++;
        [self othreTest];
    }
    
    pthread_mutex_unlock(&_lock);
}
//这里会产生死锁现象
- (void)otherTest2{
    pthread_mutex_lock(&_lock);
    NSLog(@"%s",__func__);
    [self otherTest2];
    pthread_mutex_unlock(&_lock);
}
- (void)dealloc{
    pthread_mutex_destroy(&_lock);
}
@end

