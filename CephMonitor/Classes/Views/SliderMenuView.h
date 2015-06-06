//
//  SliderMenuView.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHRevealViewController.h"

extern const CGFloat kSliderMenuViewHeaderHeight;

@interface SliderMenuView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *statusView;

+ (UIView *)setHeaderWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end
