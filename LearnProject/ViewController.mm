//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "MJClassInfo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    赋值思路
    0000 0001  mask
    
    1111 1110  -mask
    0000 0001  真实值
    
    0000 0000//  NO  与 运算
    0000 0000//  YES 或 运算
    */
    
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Person* person = [[Person alloc] init];
    
//    NSLog(@"%p",person);
    mj_objc_class * cls = (__bridge mj_objc_class *) [Person class];
    class_rw_t * rw = cls->data();
    const class_ro_t *ro = rw->ro;
    // v16@0:8
    [person run];
    NSLog(@"%p",cls);
    
    //字符编码
    NSLog(@"%s",@encode(int));
    NSLog(@"%s",@encode(SEL));
}
@end
