//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/** name */
@property(nonatomic,readwrite,copy)  NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//底层转化为MRC

//- (void)setName:(NSString *)name{
//    if (_name != name) {
//        [_name release];
// name 使用copy修饰的时候 会进行copy操作 name使用strong修饰 会使用retain
//        _name = [name copy];//copy修饰
//         _name = [name retain];//strong修饰
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self demo];
}

#pragma mark - Tappoint 面试
- (void)demo{
    // iOS 项目 要看最高有效位是否为1 1 的话是就是Tagged Pointer MAC 看最低有效位是否为1
    NSString* string1 = @"k";
    NSString* string2 = @"abcdaiouoadsasdsasilkjlsajkdlasjabcdaiouoadsasdsasilkjlsajkdlasj";
    
    NSLog(@"string1:%@  string2:%@",[string1 class],[string2 class]);
    NSLog(@"string1:%p  string2:%p",string1,string2);
    NSLock * lock = [[NSLock alloc]init];
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //程序崩溃的原因是底层多次调用release操作
    for (NSInteger i = 0; i < 1000; i++) {
        dispatch_async(queue, ^{
            //加锁
            //            [lock lock];
            self.name = [NSString stringWithFormat:@"%@",string2];
            //解锁
            //            [lock unlock];
            NSLog(@"%p",self.name);
        });
    }
    //这里不崩溃 是因为底层的Tagged Pointer self.name 直接存储的是指针地址 (Tag+数值)
//    for (NSInteger i = 0; i < 100; i++) {
//        dispatch_async(queue, ^{
//            //self.name
//            self.name = [NSString stringWithFormat:@"%@",@"abc"];
//            NSLog(@"%p",self.name);
//        });
//    }
    
    
    
}


#pragma mark - 内存布局
/**
 内存地址
 低地址     保留
 |       代码段(_TEXT)
 |       数据段(_DATA)
 |       堆
 |       栈
 |       内核
 高地址
 
 代码段: 编译之后的代码
 数据段:
 字符串常量
 已经初始化的数据: 已初始化的全局变量,静态变量
 未初始化的数据:  未初始化的全局变量,静态变量
 堆:通过alloc,malloc,calloc等动态分配,使用的内存地址越来越大
 栈:函数内的变量,函数调用开销,使用的内存地址越来越小
 */

static int m;//数据段
static int m1=10;//数据段
- (void)test{
    static int f = 10;//数据段
    int a = 10;//栈
    int b;//栈
    int c;//栈
    NSString* str = @"123";
    NSLog(@"%p --- %p ----%p",&a,&b,&c);
    NSLog(@"%p --- %p ----%p",&f,&m,&m1);
    NSLog(@"%p",str);
}


@end
