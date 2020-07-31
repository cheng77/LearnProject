//
//  MutexDemo3.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/7/29.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "MutexDemo3.h"
#import <pthread.h>
@interface MutexDemo3 ()
@property(nonatomic,readwrite,assign)  pthread_mutex_t lock;
/** 条件 */
@property(nonatomic,readwrite,assign) pthread_cond_t cond;
/** 数组 */
@property(nonatomic,readwrite,strong)  NSMutableArray *data;

@end
@implementation MutexDemo3
- (instancetype)init{
    if (self = [super init]) {
            //初始化属性
        pthread_mutexattr_t attr;
        pthread_mutexattr_init(&attr);
        /**
          PTHREAD_MUTEX_RECURSIVE 递归锁
          !!!递归锁 容许 同一个线程 对一把锁进行重复加锁
         */
        pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);

        //初始化锁
        pthread_mutex_init(&_lock, &attr);
        //初始化条件
        pthread_cond_init(&_cond, NULL);
        
        //销毁属性
        pthread_mutexattr_destroy(&attr);
        
        
    }
    return self;
}

- (void)othreTest{
    for (NSInteger i = 0; i < 5; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
        [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
    }
    
}

- (void)__remove{
    pthread_mutex_lock(&_lock);
    if (self.data.count == 0) {
        //线程等待中 会释放lock锁 ,当被唤醒时会加锁
        pthread_cond_wait(&_cond, &_lock);
    }
    [self.data removeLastObject];
    NSLog(@"移除元素");
    pthread_mutex_unlock(&_lock);
}

- (void)__add{
    pthread_mutex_lock(&_lock);
    [self.data addObject:@"Test"];
    //唤醒等待的线程
//    pthread_cond_signal(&_cond);
    //广播的形式唤醒等待的所有线程
    pthread_cond_broadcast(&_cond);
    NSLog(@"添加元素");
    pthread_mutex_unlock(&_lock);
}
- (void)otherTest2{
 
}
- (void)dealloc{
    pthread_mutex_destroy(&_lock);
    //销毁
    pthread_cond_destroy(&_cond);
}
@end
