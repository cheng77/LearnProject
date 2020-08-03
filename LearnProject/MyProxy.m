//
//  MyProxy.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/1.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "MyProxy.h"

@implementation MyProxy
/**
 NSProxy 直接用来处理消息转发的类
 本质区别 :
 1 如果子类继承NSObject 需要走方法查找-消息转发流程
 2 如果子类继承NSProxy  直接走消息转发流程,无须去他的缓存,分类,父类中查找方法
 */
+ (instancetype)proxyWithTarget:(id)target{
    //NSProxy 无须初始化
    MyProxy* proxy = [MyProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}
@end
