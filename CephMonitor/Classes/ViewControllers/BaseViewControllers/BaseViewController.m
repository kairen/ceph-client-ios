//
//  BaseViewController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/5.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor pageBackgroudColor];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 28, 28);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"Slider_logo"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
}

#pragma mark - Navigation Right Button Clicked Action
- (void)rightButtonAction:(id)sender {
    NSLog(@"asdadsdad");
}


@end
