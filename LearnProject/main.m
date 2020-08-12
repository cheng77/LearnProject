//
//  main.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "XNPerson.h"
#import "Dog.h"
#pragma mark - 字符串copy
void test0(){
    NSString* str1 = [NSString stringWithFormat:@"abiajhkahdjkahjdklahkdaskabiajhkahdjkahjdklahkdaskll"];
    NSString* str2 = [str1 copy];//浅拷贝
    NSMutableString* str3  = [str1 mutableCopy];//深拷贝
    NSLog(@"str1:%p\n str2:%p \n str3:%p",str1,str2,str3);
    
    [str1 release];
    [str2 release];
    [str3 release];
}

void test1(){
    NSMutableString* str1 = [[NSMutableString alloc] initWithString:@"abiajhkahdjkahjdklahkdasklabiajhkahdjkahjdklahkdaskl"];
    NSString* str2 = [str1 copy];//深拷贝
    NSMutableString* str3  = [str1 mutableCopy];//深拷贝
    NSLog(@"str1:%p\n str2:%p \n str3:%p",str1,str2,str3);
    
    [str1 release];
    [str2 release];
    [str3 release];
}

#pragma mark - NSArray copy
void test2(){
    NSArray* array1 = @[@"q1",@"q2",@"q3",@"q4"];
    NSArray* array2 = [array1 copy];//浅拷贝
    NSMutableArray* array3  = [array1 mutableCopy];//深拷贝
    NSLog(@"array1:%p   array2:%p  array3:%p",array1,array2,array3);
    
    [array1 release];
    [array2 release];
    [array3 release];
}

void test3(){
    NSMutableArray* array1 = [[NSMutableArray alloc] initWithArray:@[@"q1",@"q2",@"q3",@"q4"]];
    NSArray* array2 = [array1 copy];//深拷贝
    NSMutableArray* array3  = [array1 mutableCopy];//深拷贝
    NSLog(@"array1:%p   array2:%p  array3:%p",array1,array2,array3);
    
    [array1 release];
    [array2 release];
    [array3 release];
}

#pragma mark - NSDictonary copy
void test4(){
    NSDictionary* dictionary1 =@{@"ad":@"vl"};
    NSDictionary* dictionary2 = [dictionary1 copy];//浅拷贝
    NSMutableDictionary* dictionary3  = [dictionary1 mutableCopy];//深拷贝
    NSLog(@"dictionary1:%p   dictionary2:%p  dictionary3:%p",dictionary1,dictionary2,dictionary3);
    
    [dictionary1 release];
    [dictionary2 release];
    [dictionary3 release];
}

void test5(){
    NSMutableDictionary* dictionary1 = [[NSMutableDictionary alloc] initWithDictionary:@{@"ad":@"vl"}];
    NSDictionary* dictionary2 = [dictionary1 copy];//深拷贝
    NSMutableDictionary* dictionary3  = [dictionary1 mutableCopy];//深拷贝
    NSLog(@"dictionary1:%p   dictionary2:%p  dictionary3:%p",dictionary1,dictionary2,dictionary3);
    
    [dictionary1 release];
    [dictionary2 release];
    [dictionary3 release];
}

void test6(){
    XNPerson* person = [[XNPerson alloc]init];//1
    Dog* dog = [[Dog alloc] init];//1
    [person setDog:dog];//2
    
    person.data = [NSMutableArray array];
    // -[__NSArray0 addObject:]: unrecognized selector sent to instance
    [person.data addObject:@""];
    
    [dog release];//1
    [person release];//0 0
}

// 拷贝的目的：产生一个副本对象，跟源对象互不影响
// 修改了源对象，不会影响副本对象
// 修改了副本对象，不会影响源对象

/*
 iOS提供了2个拷贝方法
 1.copy，不可变拷贝，产生不可变副本
 
 2.mutableCopy，可变拷贝，产生可变副本
 
 深拷贝和浅拷贝
 1.深拷贝：内容拷贝，产生新的对象
 2.浅拷贝：指针拷贝，没有产生新的对象
 */
int main(int argc, char * argv[]) {
    XNPerson* person = [[XNPerson alloc]init];//1
    person.name = @"12";
    
    XNPerson* person2 = [person copy];
    person2.name = @"1234";
    
    NSLog(@"%p  %p",person,person2);
    NSLog(@"%@  %@",person.name,person2.name);
    
    [person release];
    [person2 release];

    return 0;
}
