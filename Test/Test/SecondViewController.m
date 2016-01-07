//
//  SecondViewController.m
//  Test
//
//  Created by MR.KING on 16/1/7.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createBtn];
}


-(void)createBtn{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor brownColor];
    [btn setTitle:@"改变颜色" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(changeCoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


-(void)changeCoorBtnClick:(UIButton*)sender{
    self.color([UIColor colorWithRed:[self random] green:[self random] blue:[self random] alpha:1]);
}

-(CGFloat)random{
   return (double)(arc4random()%101) /100;
}

@end
