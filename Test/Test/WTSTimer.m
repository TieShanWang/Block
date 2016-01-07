//
//  WTSTimer.m
//  k
//
//  Created by KING on 15/11/11.
//  Copyright © 2015年 KING. All rights reserved.
//

#import "WTSTimer.h"

@interface WTSTimer ()
{
    @private
    NSTimer * _timer;
}
@end

@implementation WTSTimer

/**
 *  初始化  类方法
 *
 *  @param totalTime 所要计时的总时间
 */
+(void)beginTimerWithToalTime:(NSInteger)totalTime{
    [[self defaultTimerManager] beginTimerWithToalTime:totalTime];
}

/**
 *  初始化  类方法  含回调
 *
 *  @param totalTime 所要计时的总时间
 */
+(void)beginTimerWithToalTime:(NSInteger)totalTime leftTime:(TimerLeftTime)leftTime{
    // 保存传过来的 block  leftTime
    // 我的理解是，外面传过来的leftITme  理解是一个对象，
    // 将self 的lefttime  指向leftTime
    WTSTimer * timerTmp = [self defaultTimerManager];
    timerTmp .timerLeftTime = leftTime;
    [self beginTimerWithToalTime:totalTime];
}


/**
 *   停止计时 类方法
 */
+(void)stopTimer{
    [[self defaultTimerManager] stopTimer];
}


/**
 *  初始化  对象方法
 *
 *  @param totalTime 所要计时的总时间
 */
-(void)beginTimerWithToalTime:(NSInteger)totalTime{
    // 只要传入新的时间，停止当前的计时，销毁当前定时器
    // 其实这样写是不好的，因为会频繁创建定时器销毁定时器
    // 但是定时功能，在应用中不会频繁触发
    if (_timer) {
        [self stopTimer];
    }
    _totalTime = totalTime;
    _currentLeftTime = _totalTime;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
}

/**
 *  定时器的方法
 */
-(void)timerRunning{
    
    
    _currentLeftTime -- ;
    
#warning 这里是block的调用的地方
    /**
     *  根据声明的block  没有返回值，传入一个 NSInteger 类型的值
     */
    self.timerLeftTime(_currentLeftTime);
    
    // 时间到时，退出程序
    if (_currentLeftTime == 0) {
        [self stopTimer];
        exit(1);
    }
}

/**
 *   停止计时 对象方法
 */
-(void)stopTimer{
    [_timer invalidate];
    _timer = nil;
}



/**
 *  单例对象
 *
 *  @return 单例对象
 */
+(instancetype)defaultTimerManager{
    static WTSTimer * timer = nil;
    dispatch_once_t once = 0;
    dispatch_once(&once, ^{
        if (timer == nil) {
            timer = [[WTSTimer alloc]init];
        }
    });
    return timer;
}

- (void)dealloc
{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}
@end
