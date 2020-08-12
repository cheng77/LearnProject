//
//  XNPerson.m
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/12.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "XNPerson.h"
@interface XNPerson ()<NSCopying>

@end
@implementation XNPerson

- (void)setDog:(Dog *)dog{
    //底层实现
    if (_dog != dog) {
        [_dog release];
        //这里的retain 是根据Dog属性的修饰来的 如果修饰是copy 下面就是copy操作
        _dog = [dog retain];
    }
}

- (void)setData:(NSMutableArray *)data{
    if (_data != data) {
        [_data release];
        // [data copy] 操作产生不可变副本 因此一旦data采用copy data就变为不可变 对它进行增,删就会报错
        _data = [data retain];
    }
}

- (id)copyWithZone:(NSZone *)zone{
    XNPerson* person = [[XNPerson allocWithZone:zone] init];
    person.name = self.name;
    person.data = self.data;
    person.dog = self.dog;
    return person;
}

- (void)dealloc{
//    [_dog release];
//    _dog = nil;
    
    self.dog = nil;
    self.data = nil;
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
