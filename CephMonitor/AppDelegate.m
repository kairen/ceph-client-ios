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
   
    [self remoteNotificationConfigure];
    
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

#pragma mark - Remote Notification
- (void)remoteNotificationConfigure {
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge) categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"Token: %@", deviceToken);
    NSString *toeknString = [NSString stringWithFormat:@"%@", deviceToken];
    if ([toeknString length] == 0)
        return;
    
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"<>"];
    toeknString = [toeknString stringByTrimmingCharactersInSet:set];
    toeknString = [toeknString stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *stingURL = @"";
    NSURL *url = [NSURL URLWithString:stingURL];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [urlRequest setTimeoutInterval:30.0f];
    [urlRequest setHTTPMethod:@"POST"];
    //[urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        if ([data length] >0 && error == nil) {
            NSLog(@"%@",data);
        }
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"%@", error.description);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    application.applicationIconBadgeNumber = 0;
    NSLog(@"%@",userInfo);
}


@end
