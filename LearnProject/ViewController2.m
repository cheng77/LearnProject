//
//  ViewController2.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/1.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController2.h"
#import "NSTarget.h"
#import "MyProxy.h"
@interface ViewController2 ()
/** 定时器 */
@property(nonatomic,readwrite,strong)  CADisplayLink *link;

/** time */
@property(nonatomic,readwrite,strong)  NSTimer *timer;

/** name */
@property(nonatomic,readwrite,copy)  NSString *name;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.name = @"jj";
    
    self.link = [CADisplayLink displayLinkWithTarget:[MyProxy proxyWithTarget:self] selector:@selector(demo)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
//    __weak __typeof(self)weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.3 target:[NSTarget initWithTarget:self] selector:@selector(demo) userInfo:nil repeats:YES];
    
    //1 block 可以通过弱引用解决循环引用问题
//    [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%@",weakSelf.name);
//    }];
    //
}

- (void)demo{
    NSLog(@"%s",__func__);
}

- (void)dealloc{
    NSLog(@"销毁");
    [self.link invalidate];
//    [self.timer invalidate];
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
