//
//  TableCollectionViewCell.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/3.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIView *titleBackground;
@property (nonatomic, strong) UILabel *titleLabel;

- (void)createCellWithKeys:(NSDictionary *)keys datas:(NSArray *)dats;

@end
