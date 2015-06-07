//
//  CustomAlertView.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "CustomAlertView.h"
#import "AlertTableViewHeader.h"
#import "AlertTableViewCell.h"

#define SPACE 10
#define CLOSE_SIZE 40
#define TITLE_SIZE 30

@implementation CustomAlertView

- (instancetype)init {
    CGRect frame = [[UIScreen mainScreen] bounds];
    CGSize size = CGSizeMake(CGRectGetWidth(frame) * 0.85, CGRectGetHeight(frame) * 0.6);
    self = [super initWithFrame:frame];
    if (self) {
        /**
         *  Menu View
         */
        self.mainView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(frame) - (size.width / 2), (frame.size.height / 2) - (size.height / 2), size.width, size.height)];
        self.mainView.backgroundColor = [UIColor whiteColor];
        self.mainView.layer.cornerRadius = 3;
        self.mainView.layer.masksToBounds = YES;
        self.mainView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.mainView.alpha = 0.0f;
        /**
         *  Mask View
         */
        self.maskView = [[UIView alloc] initWithFrame:frame];
        self.maskView.backgroundColor = [UIColor blackColor];
        self.maskView.alpha = 0.0f;
        /**
         *  Title Image
         */
        self.titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(SPACE, SPACE, TITLE_SIZE, TITLE_SIZE)];
        [self.mainView addSubview:self.titleImage];
        /**
         *  Title Label
         */
        self.titleLbael = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.titleImage.frame) + SPACE, CGRectGetMinY(self.titleImage.frame), CGRectGetWidth(frame) - CGRectGetMaxX(self.titleImage.frame) - (SPACE * 2), CGRectGetHeight(self.titleImage.frame))];
        self.titleLbael.font = [UIFont fontWithName:@"Helvetica-Bold" size:26];
        self.titleLbael.textColor = [UIColor customBlueColor];
        self.titleLbael.adjustsFontSizeToFitWidth = YES;
        [self.mainView addSubview:self.titleLbael];
        /**
         *  Separate Line
         */
        UIView *separateLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleLbael.frame) + SPACE, size.width, 1)];
        separateLine.backgroundColor = [UIColor customGrayColor];
        [self.mainView addSubview:separateLine];
        /**
         *  Close Button
         */
        self.closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeButton.frame = CGRectMake(0, size.height - CLOSE_SIZE, size.width, CLOSE_SIZE);
        [self.closeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
        self.closeButton.layer.borderWidth = 0.5;
        self.closeButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.closeButton addTarget:self action:@selector(closeAlertViewAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.mainView addSubview:self.closeButton];
        /**
         *  Alert TableView
         */
        self.alertTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(separateLine.frame), size.width, CGRectGetMinY(self.closeButton.frame) - CGRectGetMaxY(separateLine.frame))];
        self.alertTableView.backgroundColor = [UIColor clearColor];
        self.alertTableView.sectionHeaderHeight = 44;
        self.alertTableView.delegate = self;
        self.alertTableView.dataSource = self;
        self.alertTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.mainView addSubview:self.alertTableView];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - TableView Number Of Row In Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleDatas.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[AlertTableViewHeader alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), tableView.sectionHeaderHeight) headers:_headerTitles];
}

#pragma mark - TableView Cell For Row At IndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CellIdentifier";
    AlertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[AlertTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.titleLabel.textColor = [UIColor colorFromStatus:self.titleDatas[indexPath.row]];
    cell.titleLabel.text = self.titleDatas[indexPath.row];
    cell.detailLabel.text = self.detailDatas[indexPath.row];
    
    return cell;

}

#pragma mark - Close Button Clicked Aciton
- (void)closeAlertViewAction:(id)sender {
    [UIView animateWithDuration:0.3 animations:^{
        self.mainView.alpha = 0.0;
        self.maskView.alpha = 0.0;
        self.mainView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    } completion:^(BOOL finish){
        [self.mainView removeFromSuperview];
        [self.maskView removeFromSuperview];
        self.mainView = nil;
        self.maskView = nil;
    }];
}

#pragma mark - Show in View
- (void)show {
    [[UIApplication sharedApplication].keyWindow addSubview:self.maskView];
    [[UIApplication sharedApplication].keyWindow  addSubview:self.mainView];
    [UIView animateWithDuration:0.4 animations:^{
        self.maskView.alpha = 0.7;
    } completion:^(BOOL finish) {
        [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.4 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
            self.mainView.alpha = 1.0;
            self.mainView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:nil];
    }];
}

@end
