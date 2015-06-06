//
//  AlertTableViewCell.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "AlertTableViewCell.h"

#define XORIGIN 15
#define SPACE 5

@implementation AlertTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        /**
         *  Title Label
         */
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(XORIGIN, 0, (CGRectGetWidth(self.frame) / 2.5) - XORIGIN, CGRectGetHeight(self.frame))];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:16];
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.titleLabel];
        /**
         *  Detail Label
         */
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + SPACE, CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(self.frame) - CGRectGetMaxX(self.titleLabel.frame) - (SPACE * 2), CGRectGetHeight(self.titleLabel.frame))];
        self.detailLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:16];
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.detailLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
