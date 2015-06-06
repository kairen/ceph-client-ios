//
//  AppDelegate.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "GHRevealViewController.h"
#import "AnimateNavigationController.h"
#import "SliderMenuViewController.h"
#import "RESTClient.h"

static NSString * const RESTIPAddress = @"http://163.17.136.249:5100";

@interface AppDelegate () <GHRevealViewDelegate>

@property (nonatomic, strong) SliderMenuViewController *sliderMenuViewController;
@property (nonatomic, strong) UIView *statusMaskView;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor pageBackgroudColor];
    self.navigation = [[AnimateNavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
  
    self.revealController = [[GHRevealViewController alloc] init];
    self.sliderMenuViewController = [[SliderMenuViewController alloc] init];
    self.revealController.sidebarViewController = self.sliderMenuViewController;
    self.revealController.contentViewController = self.navigation;
    self.revealController.delegate = self;
    
    self.window.rootViewController = self.revealController;
    [self.window makeKeyAndVisible];
    
    [RESTClient initInstaceWithServerDomain:RESTIPAddress];
    [RESTClient shareInstance].restapiBaseURL = @"/api/v1";
    
    return YES;
}

- (void)sliderMenuDidComplete:(BOOL)isComplete {
    if (isComplete) {
        [self setStatusBarBackgroundColor:[UIColor customHeaderBlackColor]];
    } else {
        [self setStatusBarBackgroundColor:[UIColor customRedColor]];
    }
}

- (void)setStatusBarBackgroundColor:(UIColor *)color {
    if(!self.statusMaskView) {
        self.statusMaskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 20)];
        
        self.statusMaskView.alpha = 1.0;
        [self.window addSubview:self.statusMaskView];
    }
    self.statusMaskView.backgroundColor = color;
}

@end
