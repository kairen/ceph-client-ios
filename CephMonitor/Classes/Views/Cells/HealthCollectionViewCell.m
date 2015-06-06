//
//  ClusterCollectionViewCell.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/1.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "HealthCollectionViewCell.h"

#define SPACE 5
#define TITLE_SIZE 0.15
#define CONTENT_SIZE 0.3
#define SUB_SIZE 0.15
#define MORE_HEIGHT 20

@implementation HealthCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor customShadowColor].CGColor;
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.cornerRadius = 1;
        /**
         *  Title Image
         */
        self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(SPACE, SPACE, CGRectGetHeight(frame) * TITLE_SIZE, CGRectGetHeight(frame) * TITLE_SIZE)];
        self.titleImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.titleImage];
        /**
         *  Status Image
         */
        self.statusImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(frame) - CGRectGetWidth(self.titleImage.frame) - SPACE, CGRectGetMinY(self.titleImage.frame), CGRectGetWidth(self.titleImage.frame), CGRectGetHeight(self.titleImage.frame))];
        self.statusImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.statusImage];
        /**
         *  Status Image
         */
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleImage.frame) + SPACE, CGRectGetMinY(self.titleImage.frame), CGRectGetMinX(self.statusImage.frame) - CGRectGetMaxX(self.titleImage.frame) - (SPACE * 2), CGRectGetHeight(self.titleImage.frame))];
        self.titleLabel.textColor = [UIColor blackColor];
        [self addSubview:self.titleLabel];
        /**
         *  Content Label
         */
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(SPACE, CGRectGetMaxY(self.titleLabel.frame) * 1.5, CGRectGetWidth(frame) - (SPACE * 2), CGRectGetHeight(frame) * CONTENT_SIZE)];
        self.contentLabel.textAlignment = NSTextAlignmentCenter;
        self.contentLabel.textColor = [UIColor blackColor];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.contentLabel];
        /**
         *  Sub Content Label
         */
        self.subContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.contentLabel.frame), CGRectGetMaxY(self.contentLabel.frame), CGRectGetWidth(self.contentLabel.frame), CGRectGetHeight(frame) * SUB_SIZE)];
        self.subContentLabel.textAlignment = NSTextAlignmentCenter;
        self.subContentLabel.textColor = [UIColor blackColor];
        self.subContentLabel.numberOfLines = 0;
        self.subContentLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.subContentLabel];
        /**
         *  More Label
         */
        self.moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.contentLabel.frame), CGRectGetHeight(frame) - MORE_HEIGHT - SPACE, CGRectGetWidth(self.subContentLabel.frame), MORE_HEIGHT)];
        self.moreLabel.textAlignment = NSTextAlignmentRight;
        self.moreLabel.textColor = [UIColor customLightBlackColor];
        self.moreLabel.text = @"more...";
        [self addSubview:self.moreLabel];
    }
    return self;
}

#pragma mark - Show More Button
- (void)showMoreButton:(NSInteger)index {
    self.moreLabel.hidden = (index == 0) ? NO : YES;
}

#pragma mark - Change Frist Cell Font Size
- (void)fontSizeWithCellIndex:(NSInteger)index {
    self.titleLabel.font = (index == 0) ? [UIFont boldSystemFontOfSize:20] : [UIFont boldSystemFontOfSize:14];
    self.contentLabel.font = (index == 0) ? [UIFont boldSystemFontOfSize:26] : [UIFont boldSystemFontOfSize:18];
    self.subContentLabel.font = (index == 0) ? [UIFont systemFontOfSize:18] : [UIFont systemFontOfSize:14];
}

@end
