//
//  PoolsModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "PoolsModel.h"

@implementation PoolsModel

+ (NSDictionary *)poolKeys {
    return @{@"Key": @[@"ID", @"副本大小", @"Placement Groups", @"Write Bytes", @"Write操作次數", @"Read Bytes", @"Read 操作次數", @"KBytes Used", @"Objects", @"Dirty"]};
}

+ (NSArray *)poolName {
    return @[@"rbd", @"images", @"compute", @"volumes", @"metadata", @"data"];
}

+ (NSArray *)poolInfo {
    return @[@[@"0", @"3", @"128", @"134217728", @"33", @"0", @"0", @"0", @"0", @"0"],
             @[@"11", @"3", @"128", @"722468864", @"173", @"0", @"0", @"705536", @"1", @"1"],
             @[@"12", @"3", @"128", @"2048", @"2", @"2048", @"5", @"1", @"2", @"2"],
             @[@"13", @"3", @"128", @"0", @"0", @"0", @"0", @"0", @"0", @"0"],
             @[@"14", @"3", @"128", @"0", @"0", @"0", @"0", @"0", @"0", @"0"],
             @[@"15", @"3", @"128", @"0", @"0", @"0", @"0", @"0", @"0", @"0"]];
}

@end
