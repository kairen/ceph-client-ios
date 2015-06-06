//
//  AlertTableViewHeader.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "AlertTableViewHeader.h"

#define XORIGIN 15
#define SPACE 5

@implementation AlertTableViewHeader

- (instancetype)initWithFrame:(CGRect)frame headers:(NSArray *)headers {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        /**
         *  Title Label
         */
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(XORIGIN, 0, (CGRectGetWidth(frame) / 2.5) - XORIGIN, CGRectGetHeight(frame))];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        self.titleLabel.text = headers[0];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.titleLabel];
        /**
         *  Detail Label
         */
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + 5, CGRectGetMinY(self.titleLabel.frame), CGRectGetWidth(frame) - CGRectGetMaxX(self.titleLabel.frame) - (SPACE * 2), CGRectGetHeight(self.titleLabel.frame))];
        self.detailLabel.backgroundColor = [UIColor clearColor];
        self.detailLabel.textColor = [UIColor blackColor];
        self.detailLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        self.detailLabel.text = headers[1];
        self.detailLabel.textAlignment = NSTextAlignmentLeft;
        self.detailLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.detailLabel];
        /**
         *  Separate Line
         */
        self.separateLine = [[UIView alloc] initWithFrame:CGRectMake(XORIGIN, CGRectGetHeight(frame), CGRectGetWidth(frame) - XORIGIN, 1)];
        self.separateLine.backgroundColor = [UIColor customGrayColor];
        [self addSubview:self.separateLine];
    }
    return self;
}

@end
