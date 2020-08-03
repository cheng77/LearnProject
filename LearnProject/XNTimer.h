//
//  XNTimer.h
//  LearnProject
//
//  Created by Nitch Zheng on 2020/8/3.
//  Copyright © 2020 chengning. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Task)(void);
@interface XNTimer : NSObject

+ (NSString*)doTask:(Task)task
     startTime:(NSTimeInterval)startTime
  timeInterval:(NSTimeInterval)timeInterval
       repeats:(BOOL)repeats
         async:(BOOL)async;

+ (NSString*)doTaskWithTarget:(id)target
                     selector:(SEL)selector
                    startTime:(NSTimeInterval)startTime
                 timeInterval:(NSTimeInterval)timeInterval
                      repeats:(BOOL)repeats
                        async:(BOOL)async;

+ (void)cancelTask:(NSString*)taskName;
@end

NS_ASSUME_NONNULL_END
