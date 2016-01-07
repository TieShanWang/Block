//
//  TestTimerViewController.m
//  Test
//
//  Created by MR.KING on 16/1/7.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "TestTimerViewController.h"
#import "WTSTimer.h"

@interface TestTimerViewController ()
{
    UILabel * _lable;
}

@end

@implementation TestTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createLable];
    
    
#if  1 // 直接用函数的回调
    
    
    // 单例，全局共享的
    // 单例一旦创建，他的生命周期，就是是整个程序的声明周期，程序不退出，单例不会 dealloc
    // 也就保证了单例 对象  的属性 leftTime 会一直存在
    // 后面的花括号写的block 可以理解  1： 创建一个我们定义的类型的block 对象，传到我们的单例中  2：你内部写的所有代码都会保存在你创建的 block对象所在内存中，所以即便我们不在这个界面了，也能够执行代码
    [WTSTimer beginTimerWithToalTime:300 leftTime:^(NSInteger leftTime) {
        
        // 其实我认为，当前的block 对象，已经将 _lable 在它的内存保存了一份
        // 将 _lable 的计数器 +1
        _lable.text = [NSString stringWithFormat:@"%ld",leftTime];
    }];
    
    
    
#else // 这个也算是回调，只是没有结合函数，用的是属性
    
    // 用属性
    WTSTimer * timeTmp = [WTSTimer defaultTimerManager];
    
    // 等号后面的代码相当于创建一个我们定义的类型《typedef void(^TimerLeftTime) (NSInteger leftTime);》的对象，然后给单例对象 的 属性  leftTime  ；
    // 就相当于  Dog * dog1 = [[Dog alloc]init];   Dog * dog2 = dog1;
    // block 会将花括号内部的代码保存在她在系统中的内存中，以后在执行的时候，只是执行他的内存中的代码
    timeTmp.timerLeftTime = ^(NSInteger leftTime){
        // 其实我认为，当前的block 对象，已经将 _lable 在它的内存保存了一份
        // 将 _lable 的计数器 +1
        _lable.text = [NSString stringWithFormat:@"%ld",leftTime];
    };
    
    [WTSTimer beginTimerWithToalTime:300];
    
#endif
    
}

-(void)createLable{
    _lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _lable.backgroundColor = [UIColor brownColor];
    _lable.textColor = [UIColor whiteColor];
    [self.view addSubview:_lable];
}


@end
