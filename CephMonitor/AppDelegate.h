//
//  AppDelegate.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GHRevealViewController;
@class AnimateNavigationController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AnimateNavigationController *navigation;
@property (nonatomic, strong) GHRevealViewController *revealController;
@end

