//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
//#import "Person.h"
//#import "Son.h"
//#import "MJClassInfo.h"
//#import "Cat.h"
#import "SubCat.h"
//#import "NSObject+YNAdd.h"
//#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    NSString* page = @"10";
    // 1 super 本质
    // 2 函数堆栈
    // 3 isa本质
    // 4 消息机制
    // 5 成员变量本质
    
    /*
    1.run为什么能够调用成功？
    2.为什么self.name变成了ViewController等其他内容
    */
    id cat = [SubCat class];
    void* obj = &cat;
    [(__bridge id)obj run];
    
    
}

//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}

/**
 + (BOOL)isMemberOfClass:(Class)cls {
     return object_getClass((id)self) == cls;
 }

 - (BOOL)isMemberOfClass:(Class)cls {
     return [self class] == cls;
 }

 + (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
     }
     return NO;
 }

 - (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
         if (tcls == cls) return YES;
     }
     return NO;
 }
 
 
 */


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

- (void)test03{
    
}

//- (void) test01{
//    Son* son = [[Son alloc]init];
//    NSLog(@"3 %p",son);
//    [son run];
//
//    NSLog(@"B:%p",object_getClass(son));
//}

- (void)test02{
        /*
         * 对象方法
            A isMemberOfClass:B A 对象 是否为 B对象这种类型
            return [A class] == B;
         
            例如:
            A = [[NSObject alloc] init]
            B = [NSObject class]
            
            A isKindOfClass:B A对象是否为B对象类型以及B的子类
            for (Class tcls = [A  class]; tcls; tcls = tcls->superclass) {
                if (tcls == B) return YES;
            }
            return NO;
         */
        
    //    NSLog(@"%d",[[[NSObject alloc] init] isMemberOfClass:[NSObject class]]);
    //    NSLog(@"%d",[[[Cat alloc] init] isKindOfClass:[NSObject class]]);
        
        
//        NSLog(@"%d",[NSObject isMemberOfClass:[NSObject class]]);
//        NSLog(@"%d",[NSObject isKindOfClass:[NSObject class]]);
//        [SubCat sing];
}

@end
