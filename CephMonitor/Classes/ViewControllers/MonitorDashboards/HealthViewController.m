//
//  HealthViewController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthViewController.h"
#import "HealthCollectionViewCell.h"
#import "OSDViewController.h"
#import "MonitorViewController.h"
#import "PoolViewController.h"
#import "CustomAlertView.h"
#import "RESTClient+Root.h"
#import "HealthModel.h"
#import "HealthReportModel.h"

static NSString * const reuseIdentifier = @"Cell";

@interface HealthViewController ()

@property (nonatomic, strong) CustomAlertView *healthAlert;

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
    [cell fontSizeWithCellIndex:indexPath.row];
    cell.titleImage.image = [UIImage imageNamed:[HealthModel healthListImages][indexPath.row]];
    
    cell.statusImage.image = [UIImage imageNamed:[self infosWithStatus:self.healthModel.healthListStatusInfos[indexPath.row]][@"Image"]];
    
    cell.titleLabel.text = [HealthModel healthListTitles][indexPath.row];
    
    cell.contentLabel.text = self.healthModel.healthListContentInfos[indexPath.row];
    
    cell.subContentLabel.text = [HealthModel healthListSubContentInfos][indexPath.row];
    
    [cell showMoreStatus:[self.healthModel.healthCounts[indexPath.row] integerValue] message:self.healthModel.healthMessages[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HealthReportModel *healthReportModel = [HealthReportModel createModelWithArray:self.healthModel.summary];
        [healthReportModel mappingObject];
        self.healthAlert = [[CustomAlertView alloc] init];
        self.healthAlert.titleImage.image = [UIImage imageNamed:[HealthModel healthListImages][indexPath.row]];
        self.healthAlert.titleLbael.text = @"Health Report";
        self.healthAlert.headerTitles = @[@"SEVERITY", @"DETAILS"];
        self.healthAlert.titleDatas = healthReportModel.severityDatas;
        self.healthAlert.detailDatas = healthReportModel.detailsDatas;
        [self.healthAlert show];
    } else if (indexPath.row == 1) {
        OSDViewController *osdViewController = [[OSDViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:osdViewController animated:YES];
    } else if (indexPath.row == 2) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        MonitorViewController *monitorController = [[MonitorViewController alloc] initWithCollectionViewLayout:layout];
        [self.navigationController pushViewController:monitorController animated:YES];
    } else if (indexPath.row == 3) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        PoolViewController *poolController = [[PoolViewController alloc] initWithCollectionViewLayout:layout];
        [self.navigationController pushViewController:poolController animated:YES];
    }
}

@end
