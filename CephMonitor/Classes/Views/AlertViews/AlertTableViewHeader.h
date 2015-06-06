//
//  AlertTableViewHeader.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertTableViewHeader : UIView

@property (nonatomic, strong) UIView *separateLine;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;

- (instancetype)initWithFrame:(CGRect)frame headers:(NSArray *)headers;

@end
