//
//  FistViewController.m
//  Test
//
//  Created by MR.KING on 16/1/7.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "FistViewController.h"
#import "SecondViewController.h"

@interface FistViewController ()

@end

@implementation FistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    self.title = @"被修改的view";
    
    // block 的使用就是
    // 1. 哪个地方需要用它传过来的参数，或者需要它返回的参数，或需要它   就在哪里实现
    // 2. 哪个地方需要主动传递参数，或主动。  在哪里声明，调用
    // eg： 现在的这个    first  需要被更改颜色，需要block传递过来的参数，就在这里实现
    //                  second  需要主动的传递颜色，那么声明、调用就在second中，
    [self createBtn];
    
}


-(void)createBtn{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor brownColor];
    [btn setTitle:@"PUSH" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)push:(UIButton*)sender{
    SecondViewController * second = [[SecondViewController alloc]init];
    
    
    // 不知道为什么有时候需要加 __weak(不加会报警告)  有时候不用
    // 同样也是为了保证，block的实现是在一个声明周期比较长的控制器里，
     __weak typeof(self) weakSelf = self;
     second.color = ^(UIColor * color){
     weakSelf.view.backgroundColor = color;
     };
    
    
    [self.navigationController pushViewController:second animated:YES];
}



@end
