//
//  LoginViewController.m
//  CephMonitor
//
//  Created by Wu~ on 2015/5/29.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "LoginViewController.h"
#import "HealthViewController.h"
#import "HealthViewFlowLayout.h"
#import "LoginView.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    self.title = @"登入";
    self.navigationItem.hidesBackButton = YES;
    self.loginView = [[LoginView alloc] initWithFrame:[UIScreen mainScreen].fullContentFrame];
    self.view = self.loginView;
    
    self.loginView.addressTextField.delegate = self;
    self.loginView.userTextField.delegate = self;
    self.loginView.passwordTextField.delegate = self;
   
    [self.loginView.checkButton addTarget:self action:@selector(buttonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.rememberButton addTarget:self action:@selector(buttonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.signinButton addTarget:self action:@selector(buttonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Button Clicked Action
- (void)buttonClickedAction:(UIButton *)sender {
    if (sender == self.loginView.checkButton || sender == self.loginView.rememberButton) {
        self.loginView.checkButton.selected = !self.loginView.checkButton.selected;
        if (self.loginView.checkButton.selected) {
            NSLog(@"Remember Me Clicked");
        }
    }
    else if (sender == self.loginView.signinButton) {
        HealthViewFlowLayout *flowLayout = [[HealthViewFlowLayout alloc] init];
        HealthViewController *healthController = [[HealthViewController alloc] initWithCollectionViewLayout:flowLayout];
        
        [self.navigationController pushViewController:healthController animated:YES];
    }
}

#pragma mark - TextField Did Begin Editing
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor customBlueColor].CGColor;
    CGFloat keyboardHeight = self.loginView.keyboardDeviceHeight;
    if(CGRectGetMaxY(textField.frame) + CGRectGetMinY(self.loginView.loginBackground.frame) >= (CGRectGetHeight(self.view.frame) - keyboardHeight)) {
        CGFloat offsetHeight = (CGRectGetMaxY(textField.frame) + CGRectGetMinY(self.loginView.loginBackground.frame)) - (CGRectGetHeight(self.view.frame) - keyboardHeight)  ;
        [UIView animateWithDuration:0.4 animations:^{
            self.loginView.transform = CGAffineTransformMakeTranslation(0, -offsetHeight);
        }];
    }
}

#pragma mark - TextField Did End Editing
- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor customGrayColor].CGColor;
    [UIView animateWithDuration:0.2 animations:^{
        self.loginView.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark - TextField Should Return : Close Keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
