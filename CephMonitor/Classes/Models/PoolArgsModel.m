//
//  PoolsArgsModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "PoolArgsModel.h"

@implementation PoolArgsModel

+ (NSArray *)managePoolTitels {
    return @[@"rdb", @"images"];
}

+ (NSArray *)manageOSDKeys {
    return @[@[@"pgp_num", @"pg_num", @"size", @"min_size"],
             @[@"cache_target_full_ratio", @"cache_target_dirty_ratio", @"cache_min_evict_age", @"cache_min_flush_age"]];
}

+ (NSArray *)manageValues {
    return @[@[@"128", @"128", @"3", @"2"],
             @[@"800000", @"400000", @"0", @"0"]];
}


@end
