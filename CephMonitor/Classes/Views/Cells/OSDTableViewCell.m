//
//  OSDTableViewCell.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "OSDTableViewCell.h"

@interface OSDTableViewCell ()

@property (nonatomic) CGFloat height;
@end

@implementation OSDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(CGFloat)height {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.height = height;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 20, height - 20)];
        self.contentBackgroundView.backgroundColor = [UIColor whiteColor];
        self.contentBackgroundView.layer.cornerRadius = 5;
        self.contentBackgroundView.layer.borderColor = [UIColor customGreenColor].CGColor;
        self.contentBackgroundView.layer.borderWidth = 1.5;
        self.contentBackgroundView.clipsToBounds = YES;
        [self addSubview:self.contentBackgroundView];
        
        self.titleBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentBackgroundView.width, 60)];
        self.titleBackgroundView.backgroundColor = [UIColor customGreenColor];
        [self.contentBackgroundView addSubview:self.titleBackgroundView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.titleBackgroundView.width - 20, self.titleBackgroundView.height)];
        self.titleLabel.font = [UIFont fontHelveticaNeueLightSize:20];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.titleBackgroundView addSubview:self.titleLabel];
    }
    return self;
}


@end
