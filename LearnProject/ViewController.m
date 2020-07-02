//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)p_冒泡排序{
    NSMutableArray * list = @[@(13),@(113),@(103),@(1),@(123),@(11),].mutableCopy;
    for (NSInteger i = 0; i < list.count-1; i++) {
        for (NSInteger j = 0; j < list.count-1-i;j++) {
            if (list[j] < list[j+1]) {
                NSInteger temp = [[NSString stringWithFormat:@"%@",list[j]] integerValue];
                list[j] = list[j+1];
                list[j+1] = @(temp);
            }
        }
    }
    
    NSLog(@"list:%@",list);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self p_冒泡排序];
}
@end
