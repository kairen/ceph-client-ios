//
//  LoginView.h
//  CephMonitor
//
//  Created by Wu~ on 2015/5/29.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *lawTextLabel;

@property (nonatomic, strong) UIView *loginBackground;

@property (nonatomic, strong) UIImageView *loginLogoImage;

@property (nonatomic, strong) UITextField *userTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *addressTextField;

@property (nonatomic, strong) UIButton *signinButton;
@property (nonatomic, strong) UIButton *checkButton;
@property (nonatomic, strong) UIButton *rememberButton;

@end
