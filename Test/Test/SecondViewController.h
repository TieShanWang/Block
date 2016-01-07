//
//  SecondViewController.h
//  Test
//
//  Created by MR.KING on 16/1/7.
//  Copyright © 2016年 EBJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Color) (UIColor * color);

@interface SecondViewController : UIViewController

@property(nonatomic,copy)Color color;

@end
