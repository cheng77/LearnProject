//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "CCPerson.h"
#import "CCSubPerson.h"
#import "CCObserve.h"
@interface ViewController ()

@end

@implementation ViewController
{
    CCPerson *person;
    CCObserve* observe;
}
- (void)viewDidLoad {
    [super viewDidLoad];

//    [self p_validMember];
    [self p_validKVC];
}

#pragma mark - KVC&&KVO
- (void)p_validKVC{
    person = [[CCPerson alloc] init];
    observe = [[CCObserve alloc] init];
    //    [person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:@"参数"];
        
    [person addObserver:observe forKeyPath:@"height" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:@"参数"];
}
#pragma mark -
- (void)p_validMember{
    CCPerson* person = [[CCPerson alloc] init];
    CCSubPerson* person1 = [[CCSubPerson alloc] init];
    NSLog(@"person:%p",[person class]);
    NSLog(@"CCPerson:%p",[CCPerson class]);
    NSLog(@"person1:%p",[person class]);
    NSLog(@"CCSubPerson:%p",[CCSubPerson class]);
    
    
    NSLog(@"A-->%d",[person isKindOfClass:[CCPerson class]]);//1
    NSLog(@"B-->%d",[person isKindOfClass:[CCSubPerson class]]);//0
    
    NSLog(@"A1-->%d",[person isMemberOfClass:[CCPerson class]]);//1
    NSLog(@"B1-->%d",[person isMemberOfClass:[CCSubPerson class]]);//0
    
    //
    NSLog(@"A2-->%d",[person1 isKindOfClass:[CCPerson class]]);//0
    NSLog(@"B2-->%d",[person1 isKindOfClass:[CCSubPerson class]]);//1
     
    NSLog(@"A3-->%d",[person1 isMemberOfClass:[CCPerson class]]);//0
    NSLog(@"B3-->%d",[person1 isMemberOfClass:[CCSubPerson class]]);//1
    
    
    
//    BOOL res1 = [(id)[NSObject class] isKindOfClass:[NSObject class]];
//    BOOL res2 = [(id)[NSObject class] isMemberOfClass:[NSObject class]];
//    BOOL res3 = [(id)[CCPerson class] isKindOfClass:[CCPerson class]];
//    BOOL res4 = [(id)[CCPerson class] isMemberOfClass:[CCPerson class]];
//
    
}

//底层实现
/**
 
 + (BOOL)isMemberOfClass:(Class)cls {
     return self->ISA() == cls;
 }

 - (BOOL)isMemberOfClass:(Class)cls {
     return [self class] == cls;
 }
 

 + (BOOL)isKindOfClass:(Class)cls {
     for (Class tcls = self->ISA(); tcls; tcls = tcls->superclass) {
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
    [person setValue:@(20)forKey:@"height"];
    
    NSLog(@"----");
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

- (void)dealloc{
    [person removeObserver:self forKeyPath:@"age"];
    [person removeObserver:observe forKeyPath:@"age"];
}


@end
