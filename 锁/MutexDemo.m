//
//  MutexDemo.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>
@interface MutexDemo ()
@property(nonatomic,readwrite,assign)  pthread_mutex_t lock;

@property(nonatomic,readwrite,assign)  pthread_mutex_t lock1;
@end

@implementation MutexDemo

- (void)__initMutex:(pthread_mutex_t*)tex{
//    //初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
//
//    //初始化锁
//    pthread_mutex_init(tex, &attr);
//    //销毁属性
//    pthread_mutexattr_destroy(&attr);
    
    
    //初始化属性
//    pthread_mutexattr_t attr;
//    pthread_mutexattr_init(&attr);
//    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    //初始化锁 传空 相当于属性类型设置为PTHREAD_MUTEX_DEFAULT
    pthread_mutex_init(tex, NULL);
    //销毁属性
//    pthread_mutexattr_destroy(&attr);
}
- (instancetype)init{
    if (self = [super init]) {
        //静态初始化
//        pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
        
        [self __initMutex:&_lock];
        [self __initMutex:&_lock1];
    }
    return self;
}

//卖票
- (void)saveTickets{
    pthread_mutex_lock(&_lock);
    [super saveTickets];
    //如果不解锁 就会产生 死锁
    pthread_mutex_unlock(&_lock);
}

//取钱
- (void)fetchMoney{
    pthread_mutex_lock(&_lock1);
    [super fetchMoney];
    pthread_mutex_unlock(&_lock1);
}

//存钱
- (void)saveMoney{
   pthread_mutex_lock(&_lock1);
    [super saveMoney];
    pthread_mutex_unlock(&_lock1);
}

- (void)dealloc{
    pthread_mutex_destroy(&_lock);
    pthread_mutex_destroy(&_lock1);
}
@end
