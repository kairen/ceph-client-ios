//
//  OSDTableViewCell.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OSDTableViewCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(CGFloat)height;


@property (nonatomic, strong) UIView *contentBackgroundView;
@property (nonatomic, strong) UIView *titleBackgroundView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic) CGFloat maxHeight;

@end
