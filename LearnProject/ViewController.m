//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()
/**
 nonatomic
 atom:原子
 atomic:
 给属性加上atomic属性修饰,可以保证属性的setter和getter都是原子操作,也就是保证setter和getter内部是线程同步的
 注意:他不能保证使用属性的过程是线程安全的
 */
@property(atomic,readwrite,strong)  NSMutableArray *data;

/** 读写锁 */
@property(nonatomic,readwrite,assign) pthread_rwlock_t lock;

/** que */
@property(nonatomic,readwrite,strong)  dispatch_queue_t que;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.que = dispatch_queue_create("rw_que",DISPATCH_QUEUE_CONCURRENT);
    pthread_rwlock_init(&_lock, NULL);
}

/**
 atomic 举例
 */
- (void)demo{
    self.data = [[NSMutableArray alloc] init];//调用setter方法线程安全
    // [self data] 调用getter方法获取data对象是线程安全,但是对对象进行添加元素不一定是线程安全的,也就是addObject:@"" 不一定是线程安全的
    [[self data] addObject:@""];
    [[self data] removeObject:@""];
    [[self data] addObject:@""];
    [[self data] addObject:@""];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self  pthreadRwlockTest];
    /*
    for (NSInteger i = 0; i < 10; i++) {
        [self __read];
        [self __read];
        [self __read];
        [self __write];
    }
     */

}

/**
 iOS中线程读写安全方案-IO操作,也就是文件的读写操作.
 思考如何实现以下场景
 同一时间，只能有1个线程进行写的操作
 同一时间，允许有多个线程进行读的操作
 同一时间，不允许既有写的操作，又有读的操作
 
 上面的场景就是典型的“多读单写”，经常用于文件等数据的读写操作，iOS中的实现方案有
 pthread_rwlock：读写锁
 dispatch_barrier_async：异步栅栏调用
 */
- (void)pthreadRwlockTest{
    
    for (NSInteger i = 0; i < 10; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self read];
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self write];
        });
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self read];
        });
    }
}

- (void)read{
    pthread_rwlock_rdlock(&_lock);
    sleep(1.0);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_lock);
}
- (void)write{
    pthread_rwlock_wrlock(&_lock);
    sleep(1.0);
    NSLog(@"%s",__func__);
    pthread_rwlock_unlock(&_lock);
}

- (void)__read{
    dispatch_async(self.que, ^{
        sleep(1.0);
        NSLog(@"%s",__func__);
    });
}

- (void)__write{
    dispatch_barrier_async(self.que, ^{
        sleep(1.0);
        NSLog(@"%s",__func__);
    });
}

@end
