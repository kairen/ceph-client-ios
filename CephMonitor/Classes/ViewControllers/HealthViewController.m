//
//  HealthViewController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthViewController.h"
#import "HealthCollectionViewCell.h"
#import "OSDTableViewController.h"
#import "HealthModel.h"

static NSString * const reuseIdentifier = @"Cell";

@interface HealthViewController ()

@end

@implementation HealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"叢集整體健康狀態";
    self.navigationItem.hidesBackButton = YES;
    self.collectionView.backgroundColor = [UIColor pageBackgroudColor];
    
    [self.collectionView registerClass:[HealthCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (NSDictionary *)infosWithStatus:(NSString *)status {
    NSDictionary *dicts = [NSDictionary dictionary];
    if ([status isEqualToString:@"OK"]) {
        dicts = @{@"Color": @"#00A65A",
                  @"Image": @"OK_logo"};
    }
    else if ([status isEqualToString:@"WARNING"]) {
        dicts = @{@"Color": @"#EBA709",
                  @"Image": @"Warning_logo"};
    }
    else if ([status isEqualToString:@"ERROR"]) {
        dicts = @{@"Color": @"#CD2626",
                  @"Image": @"Error_logo"};
    }
    return dicts;
}

#pragma mark <UICollectionViewDelegate>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGSizeMake(CGRectGetWidth(collectionView.frame) - 20, CGRectGetHeight(collectionView.frame) * 0.3);
    }
    else {
        return CGSizeMake((CGRectGetWidth(collectionView.frame) - 30) / 2, CGRectGetHeight(collectionView.frame) * 0.22);
    }
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [HealthModel healthListTitles].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HealthCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell showMoreButton:indexPath.row];
    [cell fontSizeWithCellIndex:indexPath.row];
    cell.titleImage.image = [UIImage imageNamed:[HealthModel healthListImages][indexPath.row]];
    cell.statusImage.image = [UIImage imageNamed:[self infosWithStatus:[HealthModel healthListStatusInfos][indexPath.row]][@"Image"]];
    cell.titleLabel.text = [HealthModel healthListTitles][indexPath.row];
    cell.contentLabel.text = [HealthModel healthListContentInfos][indexPath.row];
    cell.subContentLabel.text = [HealthModel healthListSubContentInfos][indexPath.row];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"Health clicked");
    } else if(indexPath.row == 1) {
        OSDTableViewController *osdViewController = [[OSDTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:osdViewController animated:YES];
    }
}

@end
