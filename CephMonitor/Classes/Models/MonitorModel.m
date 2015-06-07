//
//  MonitorModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "MonitorModel.h"

@implementation MonitorModel

+ (NSDictionary *)monitorKeys {
    return @{@"Key": @[@"Rank", @"IP位置", @"延遲秒數", @"偏移秒數", @"健康狀態", @"細節錯誤資訊"]};
}

+ (NSArray *)moitorName {
    return @[@"ceph-node1", @"ceph-node2"];
}

+ (NSArray *)monitorInfo {
    return @[@[@"0", @"10.21.20.161:6789/0", @"0", @"0", @"正常", @"無錯誤"],
             @[@"1", @"10.21.20.161:6789/0", @"0.000618", @"0.962211", @"警告", @"clock skew 0.962211s > max 0.05s"]];
}

@end
