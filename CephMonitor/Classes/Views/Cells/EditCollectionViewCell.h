//
//  EditCollectionViewCell.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/3.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *titleBackground;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) NSMutableArray *keyObjects;
@property (nonatomic, strong) NSMutableArray *valueObjects;

- (void)createCellWithKeys:(NSArray *)keys values:(NSArray *)values;

@end
