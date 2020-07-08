//
//  ViewController.m
//  LearnProject
//
//  Created by CXN on 2020/5/21.
//  Copyright © 2020 chengning. All rights reserved.
//

#import "ViewController.h"
#import "XNPerson.h"
#import "XNCat.h"
#import "City.h"
#import <objc/runtime.h>
#import "NSObject+XNAdd.h"
@interface ViewController ()

@end

@implementation ViewController

void run(id self,SEL _cmd){
    NSLog(@"%@-%@",self,NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* json = @{
        @"name":@"上海",
        @"address":@"中山公园"
    };
    
  
    City* model = [City xn_objectWithJsonDictonary:json];
    
    NSLog(@"--");
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES).firstObject stringByAppendingString:@"archive.plist"];
    
    City* mode2;
//    if (@available(iOS 11.0, *)) {
//        
//        
//    } else {
//        [NSKeyedArchiver archiveRootObject:model toFile:path];
//        mode2 = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//    }
    
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:model requiringSecureCoding:YES error:nil];
    [data writeToFile:path atomically:YES];

    NSData* data2 = [[NSData alloc] initWithContentsOfFile:path];
    mode2 = [NSKeyedUnarchiver unarchivedObjectOfClass:[City class] fromData:data2 error:nil];
    
    NSLog(@"%@-%@",mode2.name,mode2.address);
    
}

- (void)test01{
    XNPerson* person = [[XNPerson alloc]init];
        [person run];
        //1获取一个对象的isa指向的Class
    //    object_getClass(person);
    //    NSLog(@"%p,%p",object_getClass(person),[XNPerson class]);
        //2设置一个对象的isa指向
        object_setClass(person,[XNCat class]);
        [person run];
        NSLog(@"%p,%p",object_getClass(person),[XNCat class]);
        
        //object_isClass 对象是否是一个类对象
        NSLog(@"%d,%d,%d",object_isClass(person),object_isClass(object_getClass(person)),object_isClass([XNPerson class]));
}

- (void)test02{
    XNPerson* person = [[XNPerson alloc]init];
    
    //创建这个类
    Class newClass = objc_allocateClassPair([NSObject class],"Dog", 0);
    class_addIvar(newClass,"_age",sizeof(int),1, @encode(int));
    class_addIvar(newClass,"_height",sizeof(int),1, @encode(int));
    class_addMethod(newClass, @selector(run), (IMP)run,"v@:");
    object_setClass(person, newClass);
    
    //注册这个类
    objc_registerClassPair(newClass);
    
    id dog = [[newClass alloc]init];
    [dog setValue:@10 forKey:@"_age"];
    [dog setValue:@(20) forKey:@"_height"];
    [dog run];
    
    [person run];
    
    NSLog(@"%zu",class_getInstanceSize(newClass));
    NSLog(@"%@ %@",[dog valueForKey:@"_age"],[dog valueForKey:@"_height"]);
    
    //不用了释放掉
    objc_disposeClassPair(newClass);
    
}

- (void)test04{
    XNPerson* person = [[XNPerson alloc]init];
    //获取成员变量
    Ivar ivar = class_getInstanceVariable([XNPerson class],"_age");
    NSLog(@"%s  %s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    
    //设置成员变量的指
    object_setIvar(person, ivar,@"12");
    //获取成员变量的值
    NSLog(@"%@",object_getIvar(person, ivar));
    NSLog(@"%@",person.age);
}

- (void)test05{
    XNPerson* person = [[XNPerson alloc]init];
    
    unsigned int count;
    Ivar* list = class_copyIvarList([UITextField class],&count);
    
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = list[i];
        NSLog(@"%s  %s",ivar_getName(ivar),ivar_getTypeEncoding(ivar));
    }
    
    free(list);
    Ivar ivar = class_getInstanceVariable([UITextField class],"_placeholderLabel");
    
    UILabel* lable =  object_getIvar(self.name, ivar);
    lable.textColor = [UIColor redColor];
}
@end
