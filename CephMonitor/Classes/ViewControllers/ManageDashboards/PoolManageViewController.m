//
//  ManagePoolViewController.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/3.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "PoolManageViewController.h"
#import "EditCollectionViewCell.h"
#import "PoolArgsModel.h"

#define CELL_HEIGHT 55

@interface PoolManageViewController () <UITextFieldDelegate>

@end

@implementation PoolManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Pool 參數設定";
    self.collectionView.backgroundColor = [UIColor pageBackgroudColor];
    
    [self.collectionView registerClass:[EditCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    
}

#pragma mark - CollectionView Number Of Items In Section
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [PoolArgsModel managePoolTitels].count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(CGRectGetWidth(collectionView.frame) - 20, CELL_HEIGHT * [[PoolArgsModel manageOSDKeys][indexPath.row] count] + 30);
}

#pragma mark - CollectionView Cell For Item At IndesPath
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EditCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.titleLabel.text = [PoolArgsModel managePoolTitels][indexPath.row];
    [cell createCellWithKeys:[PoolArgsModel manageOSDKeys][indexPath.row] values:[PoolArgsModel manageValues][indexPath.row]];
    for (UIView *view in cell.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [(UIButton *)view addTarget:self action:@selector(editButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        else if ([view isKindOfClass:[UITextField class]]) {
            ((UITextField *)view).delegate = self;
        }
    }
    return cell;
}

#pragma mark - Edit Button Clicked Action
- (void)editButtonClickedAction:(UIButton *)sender {
    NSMutableArray *textDatas = [NSMutableArray array];
    UITableViewCell *buttonCell = (UITableViewCell *)[sender superview];
    for (UIView *subView in buttonCell.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            [textDatas addObject:((UITextField *)subView).text];
        }
    }
    NSLog(@"%@", textDatas[sender.tag]);
}

#pragma mark - TextField Should Return : Close Keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

@end
