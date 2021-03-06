//
//  MonitorViewController.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/3.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "MonitorViewController.h"
#import "MonCollectionViewCell.h"
#import "MonitorModel.h"

#define CELL_HEIGHT 55

@interface MonitorViewController ()

@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"叢集MON資訊";
    self.collectionView.backgroundColor = [UIColor pageBackgroudColor];
    [self.collectionView registerClass:[MonCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
}

#pragma mark - CollectionView Number Of Items In Section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [MonitorModel moitorName].count;
}

#pragma maark - CollectionView Cell Size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame) - 20, CELL_HEIGHT * [[MonitorModel monitorInfo][indexPath.row] count] + 30);
}

#pragma mark - CollectionView Cell For Item At IndesPath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.titleLabel.text = [MonitorModel moitorName][indexPath.row];
    [cell createCellWithKeys:[MonitorModel monitorKeys] datas:[MonitorModel monitorInfo][indexPath.row]];
    
    return cell;
}

@end
