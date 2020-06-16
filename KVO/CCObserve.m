//
//  CCObserve.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "CCObserve.h"

@implementation CCObserve
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"CCObserve监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}
@end
