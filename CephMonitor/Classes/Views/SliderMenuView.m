//
//  SliderMenuView.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "SliderMenuView.h"

const CGFloat kSliderMenuViewHeaderHeight = 50;

@implementation SliderMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor customBlackColor];
        self.frame = CGRectMake(0, 0, kGHRevealSidebarWidth, CGRectGetHeight(self.bounds));
        /**
         *  Slide Menu TableView
         */
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, kGHRevealSidebarWidth, CGRectGetHeight(self.bounds) - 20) style:UITableViewStylePlain];
        self.tableView.backgroundColor = [UIColor clearColor];
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVibrancyEffect *vibrancyEffact = [UIVibrancyEffect effectForBlurEffect:blurEffect];
        self.tableView.separatorEffect = vibrancyEffact;
        self.tableView.separatorColor = [UIColor customGrayColor];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.tableView.rowHeight = 44;
        self.tableView.scrollsToTop = NO;
        [self addSubview:self.tableView];
        /**
         *  Status Bar Background
         */
        self.statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kGHRevealSidebarWidth, 20)];
        self.statusView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.statusView];
    }
    return self;
}

+ (UIView *)setHeaderWithTitle:(NSString *)title imageName:(NSString *)imageName {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, kGHRevealSidebarWidth, kSliderMenuViewHeaderHeight)];
    headerView.backgroundColor = [UIColor customHeaderBlackColor];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12, 20, 20)];
    headerImage.image = [UIImage imageNamed:imageName];
    [headerView addSubview:headerImage];
    
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headerImage.frame) + 5, CGRectGetMinY(headerImage.frame), CGRectGetWidth(headerView.frame) - CGRectGetMaxX(headerImage.frame) - 10, CGRectGetHeight(headerImage.frame))];
    headerTitle.textColor = [UIColor whiteColor];
    headerTitle.font = [UIFont fontHelveticaNeueBoldSize:20];
    headerTitle.text = title;
    [headerView addSubview:headerTitle];
    
    return headerView;
}

@end
