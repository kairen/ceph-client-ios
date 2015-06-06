//
//  LogTableViewCell.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "LogTableViewCell.h"

#define SPACE 5
#define DATE_HEIGHT 50

@implementation LogTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    CGSize size = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.frame));
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        /**
         *  Date Left View
         */
        self.dateLine = [[UIView alloc] initWithFrame:CGRectMake(SPACE, SPACE, SPACE, DATE_HEIGHT)];
        self.dateLine.backgroundColor = [UIColor customGreenColor];
        [self addSubview:self.dateLine];
        /**
         *  Date Label
         */
        self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dateLine.frame) + SPACE, CGRectGetMinY(self.dateLine.frame), size.width - CGRectGetMaxX(self.dateLine.frame) - SPACE, CGRectGetHeight(self.dateLine.frame))];
        self.dateLabel.font = [UIFont fontWithName:@"Helvetica-Blod" size:18];
        self.dateLabel.numberOfLines = 0;
        [self addSubview:self.dateLabel];
        /**
         *  Info Left View
         */
        self.infoLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.dateLine.frame), CGRectGetMaxY(self.dateLine.frame) + 2, CGRectGetWidth(self.dateLine.frame), 80)];
        self.infoLine.backgroundColor = [UIColor customBlueColor];
        [self addSubview:self.infoLine];
        /**
         *  Info Label
         */
        self.infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.dateLabel.frame), CGRectGetMinY(self.infoLine.frame), CGRectGetWidth(self.dateLabel.frame), 80)];
        self.infoLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:16];
        self.infoLabel.numberOfLines = 0;
        [self addSubview:self.infoLabel];
    }
    return self;
}

#pragma mark - Adjust Cell Height
- (CGFloat)adjustCellHeight {
    [self.dateLabel sizeToFit];
    self.dateLine.frame = CGRectMake(SPACE, SPACE, SPACE, CGRectGetHeight(self.dateLabel.frame));
    return [self adjustInfo];
}

#pragma mark - Adjust Info
- (CGFloat)adjustInfo {
    [self.infoLabel sizeToFit];
    self.infoLabel.frame = CGRectMake(CGRectGetMinX(self.infoLabel.frame), CGRectGetMaxY(self.dateLabel.frame) + 2, CGRectGetWidth(self.infoLabel.frame), CGRectGetHeight(self.infoLabel.frame));
    self.infoLine.frame = CGRectMake(CGRectGetMinX(self.infoLine.frame), CGRectGetMinY(self.infoLabel.frame), CGRectGetWidth(self.infoLine.frame), CGRectGetHeight(self.infoLabel.frame));
    return CGRectGetMaxY(self.infoLabel.frame) + 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
