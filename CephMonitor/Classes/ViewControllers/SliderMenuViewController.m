//
//  SliderMenuViewController.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "SliderMenuViewController.h"
#import "GHRevealViewController.h"
#import "PoolManageViewController.h"
#import "SliderMenuView.h"
#import "SliderMenuModel.h"
#import "AppDelegate.h"

@interface SliderMenuViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic, strong) SliderMenuView *sliderMenuView;

@end

@implementation SliderMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sliderMenuView = [[SliderMenuView alloc] initWithFrame:self.view.frame];
    self.view = self.sliderMenuView;
    
    self.sliderMenuView.tableView.delegate = self;
    self.sliderMenuView.tableView.dataSource = self;
}

#pragma mark - TableView Number of Section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [SliderMenuModel sliderMenuHeaderTitles].count;
}

#pragma mark - TableView Number Of Rows In Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[SliderMenuModel sliderMenuContentTitles][section] count];
}

#pragma mark - TableView Height For header In Section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kSliderMenuViewHeaderHeight;
}

#pragma mark - TableView For Header In Section
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [SliderMenuView setHeaderWithTitle:[SliderMenuModel sliderMenuHeaderTitles][section]
                                    imageName:[SliderMenuModel sliderMenuHeaderIcons][section]];
}

#pragma mark - TableView Cell For Row At IndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"VLCMenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.font = [UIFont fontHelveticaNeueLightSize:16];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = [SliderMenuModel sliderMenuContentTitles][indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark - TableView Did Select
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && indexPath.row == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"系統訊息"
                                                        message:@"您是否要登出？"
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                              otherButtonTitles:@"登出", nil];
        [alert show];
    }
    else {
        [self revealItem:indexPath.row inSection:indexPath.section];
    }
}

#pragma mark - AlertView Clicked Button Action
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self revealItem:1 inSection:2];
    }
}

#pragma mark - Slider Menu Clicked Reveal Controller
- (void)revealItem:(NSInteger)row inSection:(NSInteger)section {
    
    if (section == 1 && row == 2) {
    }
    
}
@end
