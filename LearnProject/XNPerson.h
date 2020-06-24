//
//  XNPerson.h
//  LearnProject
//
//  Created by CXN on 2020/6/23.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^Success)(void);
NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject
/** age */
@property(nonatomic,readwrite,assign)  int age;

/** block */
@property(nonatomic,readwrite,copy)  Success success;
@end

NS_ASSUME_NONNULL_END
