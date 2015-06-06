//
//  AnimateNavigationController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "AnimateNavigationController.h"
#import "TransitionAnimation.h"

@interface AnimateNavigationController ()

@end

@implementation AnimateNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBarTintColor:[UIColor customRedColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontHelveticaNeueBoldSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontHelveticaNeueLightSize:16], NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    
    self.navigationBar.layer.shadowColor = [UIColor grayColor].CGColor;
    self.navigationBar.layer.shadowOpacity = 1.0;
    self.navigationBar.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.navigationBar.bounds].CGPath;
    self.navigationBar.layer.shadowOffset = CGSizeMake(0, 2);
    
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    self.navigationBar.translucent = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.visibleViewController.navigationController.delegate = self;
}

#pragma mark - View Controller Animation Delegate
- (id<UIViewControllerAnimatedTransitioning>) animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    TransitionAnimation *transitionAnimation = [[TransitionAnimation alloc] init];
    transitionAnimation.goingRight = NO;
    return transitionAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    TransitionAnimation *transitionAnimation = [[TransitionAnimation alloc] init];
    transitionAnimation.goingRight = YES;
    return transitionAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    TransitionAnimation *transitionAnimation = [[TransitionAnimation alloc] init];
    transitionAnimation.goingRight = (operation == UINavigationControllerOperationPush) ? YES:NO;
    return transitionAnimation;
}

@end
