//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController2* vc = [[ViewController2 alloc]init];
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
