//
//  CustomAlertView.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *mainView;

@property (nonatomic, strong) UIImageView *titleImage;
@property (nonatomic, strong) UILabel *titleLbael;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UITableView *alertTableView;

@property (nonatomic, strong) NSArray *headerTitles;
@property (nonatomic, strong) NSArray *titleDatas;
@property (nonatomic, strong) NSArray *detailDatas;

- (void)show;

@end
