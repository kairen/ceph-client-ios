//
//  OSDTableViewController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "OSDTableViewController.h"
#import "OSDTableViewCell.h"
#import "RESTClient+OSD.h"

@interface OSDTableViewController ()

@property (nonatomic) NSInteger selectIndex;
@property (nonatomic) NSInteger selectHeight;

@end

@implementation OSDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"叢集OSD資訊";
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
    self.selectIndex = -1;
    
    [[RESTClient shareInstance] objectStorageStateWithResponse:^(id responseObject) {
        NSLog(@"%@",responseObject);
    }];
    
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.selectIndex == indexPath.row) {
        self.selectIndex = -1;
    } else {
        OSDTableViewCell *cell = (OSDTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        self.selectHeight = cell.maxHeight;
        self.selectIndex = indexPath.row;
    }
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect frame =  ((OSDTableViewCell*)cell).contentBackgroundView.frame;
    frame.size.height = (self.selectIndex == indexPath.row) ? 300 - 20 : tableView.rowHeight - 20;
    [UIView animateWithDuration:0.5 animations:^{
        ((OSDTableViewCell*)cell).contentBackgroundView.frame = frame;
    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.selectIndex != indexPath.row ? tableView.rowHeight : 300;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.width - 20, headerView.height)];
    headerTitle.font = [UIFont fontHelveticaNeueBoldSize:22];
    headerTitle.text = @"Ceph-node1";
    [headerView addSubview:headerTitle];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"OSDReuseIdentitfer";
    OSDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[OSDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier height:tableView.rowHeight];
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"OSD %ld", indexPath.row];

    return cell;
}

@end
