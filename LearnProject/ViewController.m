//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.

//

// clang: xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc -fobjc-arc -fobjc-runtime=ios-8.0.0 ViewController.m

#import "ViewController.h"
#import "XNPerson.h"
#import "ViewController2.h"
typedef  void (^TestBlock2)(void);
typedef  void(^SuccessBlock)(void);

@interface ViewController ()
/** person */
@property(nonatomic,readwrite,strong)  XNPerson *person;
@end

@implementation ViewController

- (void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
        void (*Block)(void) = & block结构体(函数指针,&描述);
      //通过block内部的函数指针 直接找到赋值的函数,调用即可
        (Block->FuncPtr)(Block);
     */
    
    void (^Block)(void) = ^{
        NSLog(@"---");
    };
    Block();
    
    
    /*************/
//    NSObject *object = [[NSObject alloc] init];
//    __weak NSObject *weakObject = object;
    

//    NSLog(@"测试:%@", ^{
//           NSLog(@"调用:%p",object);
//    });
//    
//    
//    
//    NSLog(@"%@",[TestBlock2 class]);
//    NSLog(@"%@",[[TestBlock2 class] superclass]);
//    NSLog(@"%@",[[[TestBlock2 class] superclass] superclass]);
//    NSLog(@"%@",[[[[TestBlock2 class] superclass] superclass] superclass]);
//    
//    SuccessBlock block = [self success];
//    block();
//    NSLog(@"block:%@",[block class]);
    
    
//    __block int age = 10;
    //    NSLog(@"%@",^{
    //        age = 20;
    //        NSLog(@"主题:%d",age);
    //    });
    
    
//    __block XNPerson* person = [[XNPerson alloc] init];
//    person.age = 10;
//
////    __weak typeof(person) weakPerson = person;
//    person.success = ^{
//        NSLog(@"age %d",person.age);
//        //利用__block 但是必须调用block
//          person = nil;
//    };
    
//
    //循环引用
//    person.success();
    
//    self.person = [[XNPerson alloc]init];
//
//    SuccessBlock block = ^{
//        NSLog(@"age is %d",self.person.age);
//    };
//
//    block();

}

- (SuccessBlock)success{
    return ^{
        NSLog(@"---");
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    ViewController2* vc = [[ViewController2 alloc] init];
    UINavigationController* nava = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nava animated:YES completion:nil];
}
@end
