//
//  ViewController2.m
//  LearnProject
//
//  Created by CXN on 2020/6/24.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController2.h"
#import "XNPerson.h"
typedef  void (^TestBlock2)(void);
typedef  void(^SuccessBlock)(void);


@interface ViewController2 ()
/** person */
@property(nonatomic,readwrite,strong)  XNPerson *person;
@end

@implementation ViewController2

- (void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
      self.person = [[XNPerson alloc]init];
       
       SuccessBlock block = ^{
           NSLog(@"age is %d",self.person.age);
       };
    
    __weak typeof(self.person) weakPerson = self.person;
    self.person.success = ^{
        NSLog(@"age is %d",weakPerson.age);
    };

       block();
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
