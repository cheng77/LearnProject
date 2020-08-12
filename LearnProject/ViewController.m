//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    __strong XNPerson* person1;
    __weak   XNPerson* person2;//对象释放将对象置为nil
    __unsafe_unretained XNPerson* person3 ;//对象释放不会置为nil 会产生野指针
    
    NSLog(@"开始");
    {
        XNPerson* person = [[XNPerson alloc]init];
        person3 = person;
    }
    NSLog(@"结束:%@",person1);
    
}


@end
