//
//  LogViewController.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "LogViewController.h"
#import "LogTableViewCell.h"
#import "LogModel.h"

@interface LogViewController ()

@property (nonatomic) CGFloat cellHeight;

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Log";
}

#pragma mark - TableView Number Of Rows In Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [LogModel logDate].count;
}

#pragma mark - TableView Height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}

#pragma mark - TableView Cell For Row At IndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    LogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[LogTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.dateLabel.text = [LogModel logDate][indexPath.row];
    cell.infoLabel.text = [LogModel logInfo][indexPath.row];
    self.cellHeight = cell.adjustCellHeight;
    
    return cell;
}

@end
