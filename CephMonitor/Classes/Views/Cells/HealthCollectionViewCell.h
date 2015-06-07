//
//  ClusterCollectionViewCell.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/1.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HealthCheckType) {
    HealthCheckOkay = 0,
    HealthCheckWarn,
    HealthCheckError
};


@interface HealthCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *titleImage;
@property (nonatomic, strong) UIImageView *statusImage;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *subContentLabel;
@property (nonatomic, strong) UILabel *moreLabel;

- (void)showMoreButton:(NSInteger)index;
- (void)fontSizeWithCellIndex:(NSInteger)index;


- (void)showMoreStatus:(HealthCheckType)health message:(NSString *)message;

@end
