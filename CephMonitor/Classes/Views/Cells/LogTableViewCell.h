//
//  LogTableViewCell.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *dateLine;
@property (nonatomic, strong) UIView *infoLine;

@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *infoLabel;

- (CGFloat)adjustCellHeight;

@end
