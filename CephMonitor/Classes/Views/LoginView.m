//
//  LoginView.m
//  CephMonitor
//
//  Created by Wu~ on 2015/5/29.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "LoginView.h"

#define HEIGHT 295
#define LOGO_SCALE 0.15
#define WIDTH_SCALE 0.9
#define TEXTFIELD_HEIGHT 33

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    CGSize backgroundSize = CGSizeMake(CGRectGetWidth(frame) * WIDTH_SCALE, HEIGHT);
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor pageBackgroudColor];
        /**
         *  Login View Background
         */
        self.loginBackground = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(frame) - (backgroundSize.width / 2), CGRectGetMidY(frame) - (backgroundSize.height / 2), backgroundSize.width, backgroundSize.height)];
        self.loginBackground.backgroundColor = [UIColor whiteColor];
        self.loginBackground.layer.shadowOffset = CGSizeMake(0, 1);
        self.loginBackground.layer.shadowRadius = 5;
        self.loginBackground.layer.shadowOpacity = 1.0;
        self.loginBackground.layer.shadowColor = [UIColor customShadowColor].CGColor;
        [self addSubview:self.loginBackground];
        /**
         *  Logo Image
         */
        self.loginLogoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login_logo"]];
        self.loginLogoImage.frame = CGRectMake(CGRectGetMinX(self.loginBackground.frame), CGRectGetMinY(self.loginBackground.frame) - (CGRectGetHeight(frame) * (LOGO_SCALE / 2)), CGRectGetWidth(self.loginBackground.frame), CGRectGetHeight(frame) * LOGO_SCALE);
        self.loginLogoImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.loginLogoImage];
        /**
         *  Title Label
         */
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.loginBackground.frame) * ((1 - WIDTH_SCALE) / 2), CGRectGetHeight(self.loginLogoImage.frame) / 2, CGRectGetWidth(self.loginBackground.frame) * WIDTH_SCALE, 25)];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:14];
        self.titleLabel.textColor = [UIColor customLightBlackColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"Sign in to start your session";
        [self.loginBackground addSubview:self.titleLabel];
        /**
         *  Create TextFiled : address, user, password
         */
        self.addressTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 15, CGRectGetWidth(self.titleLabel.frame), TEXTFIELD_HEIGHT)];
        [self createTextFieldImage:self.addressTextField imageName:@"Address_logo"];
        self.addressTextField.text = @"http://163.17.136.249:8080";
        self.addressTextField.placeholder = @"http://loaclhost:5100";
        
        self.userTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.addressTextField.frame), CGRectGetMaxY(self.addressTextField.frame) + 15, CGRectGetWidth(self.addressTextField.frame), CGRectGetHeight(self.addressTextField.frame))];
        [self createTextFieldImage:self.userTextField imageName:@"User_logo"];
        self.userTextField.placeholder = @"使用者帳號";
        self.userTextField.text = @"admin";
        
        self.passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.userTextField.frame), CGRectGetMaxY(self.userTextField.frame) + 15, CGRectGetWidth(self.userTextField.frame), CGRectGetHeight(self.userTextField.frame))];
        [self createTextFieldImage:self.passwordTextField imageName:@"Password_logo"];
        self.passwordTextField.placeholder = @"使用者密碼";
        self.passwordTextField.text = @"admin";
        self.passwordTextField.secureTextEntry = YES;
        /**
         *  Signin Button
         */
        self.signinButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.signinButton.frame = CGRectMake(CGRectGetMaxX(self.passwordTextField.frame) - (CGRectGetWidth(self.userTextField.frame) * 0.4), CGRectGetMaxY(self.passwordTextField.frame) + 15, CGRectGetWidth(self.userTextField.frame) * 0.4, CGRectGetHeight(self.passwordTextField.frame));
        self.signinButton.backgroundColor = [UIColor customBlueColor];
        [self.signinButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.signinButton setTitle:@"登入" forState:UIControlStateNormal];
        [self.loginBackground addSubview:self.signinButton];
        /**
         *  Remember Me
         */
        self.checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.checkButton.frame = CGRectMake(CGRectGetMinX(self.userTextField.frame), CGRectGetMaxY(self.signinButton.frame) - 20, 20, 20);
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"Uncheck_logo"] forState:UIControlStateNormal];
        [self.checkButton setBackgroundImage:[UIImage imageNamed:@"Check_logo"] forState:UIControlStateSelected];
        [self.loginBackground addSubview:self.checkButton];
        
        self.rememberButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.checkButton.frame), CGRectGetMinY(self.checkButton.frame), CGRectGetMinX(self.signinButton.frame) - CGRectGetMaxX(self.checkButton.frame), CGRectGetHeight(self.checkButton.frame))];
        [self.rememberButton setTitleColor:[UIColor customLightBlackColor] forState:UIControlStateNormal];
        self.rememberButton.titleLabel.font = [UIFont systemFontOfSize:14];
        self.rememberButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.rememberButton.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
        [self.rememberButton setTitle:@"Remember Me" forState:UIControlStateNormal];
        [self.loginBackground addSubview:self.rememberButton];
        /**
         *  Law Text
         */
        self.lawTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) - 30, CGRectGetWidth(frame), 30)];
        self.lawTextLabel.textColor = [UIColor blackColor];
        self.lawTextLabel.textAlignment = NSTextAlignmentCenter;
        self.lawTextLabel.font = [UIFont systemFontOfSize:12];
        self.lawTextLabel.text = @"Copyright © 2014-2015 i.m.a.c All rights reserved.";
        [self addSubview:self.lawTextLabel];
    }
    return self;
}

#pragma mark - Create TextField With RightView
- (void)createTextFieldImage:(UITextField *)textField imageName:(NSString *)imageName {
    /**
     *  Left add space
     */
    UIView *spaceView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 10, 10)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = spaceView;

    UIImageView *textFieldImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    textFieldImage.frame = CGRectMake(0, 0, 35, 20);

    textField.layer.borderWidth = 1;
    textField.layer.borderColor = [UIColor customGrayColor].CGColor;
    textField.rightViewMode = UITextFieldViewModeAlways;
    textField.rightView = textFieldImage;
    textField.keyboardType = UIKeyboardTypeASCIICapable;
    [self.loginBackground addSubview:textField];
}

@end
