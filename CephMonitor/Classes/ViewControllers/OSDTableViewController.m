//
//  OSDTableViewController.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "OSDTableViewController.h"
#import "OSDTableViewCell.h"
#import "OSDModel.h"
#import "RESTClient+OSD.h"

@interface OSDTableViewController ()

@property (nonatomic) NSInteger selectIndex;
@property (nonatomic) NSInteger selectSection;
@property (nonatomic) NSInteger selectHeight;
@property (nonatomic, strong) OSDModel *osdModel;

@end

@implementation OSDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"叢集OSD資訊";
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
    self.selectIndex = -1;
    self.selectSection = -1;
    
    typeof(self) __weak weakSelf = self;
    [[RESTClient shareInstance] objectStorageDumpEpoch:-1 response:^(id osds) {
        weakSelf.osdModel = [OSDModel createModelWithDict:osds];
        for(int i = 0 ; i < weakSelf.osdModel.count ; i++) {
            [self.osdModel mappingObjectWithIndex:i];
            [[RESTClient shareInstance] objectStorageMetadataFind:self.osdModel.identity response:^(id metadatas) {
                [weakSelf.osdModel addObjectStorageMetadata:metadatas withID:i];
                if(weakSelf.osdModel.count >= i) {
                    [weakSelf.tableView reloadData];
                }
            }];
        }
    }];
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(self.selectIndex == indexPath.row && self.selectSection == indexPath.section) {
        self.selectIndex = -1;
        self.selectSection = -1;
    } else {
        OSDTableViewCell *cell = (OSDTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        self.selectHeight = cell.maxHeight;
        self.selectIndex = indexPath.row;
        self.selectSection = indexPath.section;
    }
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect frame =  ((OSDTableViewCell*)cell).contentBackgroundView.frame;
    frame.size.height = (self.selectIndex == indexPath.row && self.selectSection == indexPath.section) ? 300 : tableView.rowHeight - 20;
    [UIView animateWithDuration:0.5 animations:^{
        ((OSDTableViewCell*)cell).contentBackgroundView.frame = frame;
    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.osdModel.hostNames.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(self.osdModel.hostNames.count > 0) {
        NSArray *hostIds = self.osdModel.hostNames[self.osdModel.hostNames.allKeys[section]];
        return hostIds.count;
    }
    return 0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (self.selectIndex == indexPath.row && self.selectSection == indexPath.section) ? 320:tableView.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    headerView.backgroundColor = [UIColor pageBackgroudColor];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, headerView.width - 20, headerView.height)];
    headerTitle.font = [UIFont fontHelveticaNeueBoldSize:22];
    headerTitle.text = self.osdModel.hostNames.allKeys[section];
    [headerView addSubview:headerTitle];
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"OSDReuseIdentitfer";
    OSDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell) {
        cell = [[OSDTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier height:tableView.rowHeight];
    }
    
    if(self.osdModel && self.osdModel.hostNames.count > 0) {
        NSArray *hostIds = self.osdModel.hostNames[self.osdModel.hostNames.allKeys[indexPath.section]];
        [self.osdModel mappingObjectWithIndex:[hostIds[indexPath.row] integerValue]];
        cell.titleLabel.text = [NSString stringWithFormat:@"OSD %ld", (long)self.osdModel.identity];
        [cell setKeyTitles:[OSDModel keyTitles] values:@[self.osdModel.clusterIP, self.osdModel.publicIP, [NSString stringWithFormat:@"%1.f",self.osdModel.weight], self.osdModel.state, self.osdModel.uuid]];
    }
    return cell;
}

@end
