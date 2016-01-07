//
//  WTSTimer.h
//  k
//
//  Created by KING on 15/11/11.
//  Copyright © 2015年 KING. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  声明一个block
 *
 *  @param leftTime 剩余的时间
 */
typedef void(^TimerLeftTime) (NSInteger leftTime);



@interface WTSTimer : NSObject

// 总共计时的时间
@property(nonatomic,assign)NSInteger totalTime;

// 当前剩余时间
@property(nonatomic,assign,readonly)NSInteger currentLeftTime;

// 使用copy是为了将block 拷贝到内存中，应该是堆
@property(nonatomic,copy)TimerLeftTime timerLeftTime;


// 带回调
+(void)beginTimerWithToalTime:(NSInteger)totalTime leftTime:(TimerLeftTime)leftTime;

// 无回调
+(void)beginTimerWithToalTime:(NSInteger)totalTime; // 传入总时间


+(void)stopTimer; // 停止时间
+(instancetype)defaultTimerManager; // 时间控制单例
@end
