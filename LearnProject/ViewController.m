//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNPerson.h"
#import "XNPerson+Test01.h"
#import "XNPerson+Test02.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XNPerson * person = [[XNPerson alloc] init];
    [person run];
    
    
}


@end
