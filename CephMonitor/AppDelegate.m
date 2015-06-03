//
//  AppDelegate.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "AppDelegate.h"
#import "OSDTableViewController.h"
#import "RESTClient.h"

static NSString * const RESTIPAddress = @"http://163.17.136.249:5100";

@interface AppDelegate ()

@property (strong, nonatomic) UINavigationController *navigation;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor pageBackgroudColor];
    self.navigation = [[UINavigationController alloc] initWithRootViewController:[[OSDTableViewController alloc] init]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor customRedColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontHelveticaNeueBoldSize:20], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigation.navigationBar.translucent = NO;
    
    self.window.rootViewController = self.navigation;
    [self.window makeKeyAndVisible];
    
    [RESTClient initInstaceWithServerDomain:RESTIPAddress];
    [RESTClient shareInstance].restapiBaseURL = @"/api/v1";
    
    return YES;
}

@end
