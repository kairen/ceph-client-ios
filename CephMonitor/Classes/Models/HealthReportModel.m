//
//  HealthReportModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthReportModel.h"

@implementation HealthReportModel


+ (NSArray *)severityDatas {
    return @[@"WARN", @"WARN", @"WARN", @"WARN"];
}

+ (NSArray *)detailsDatas {
    return @[@"960 pgs degraded", @"960 pgs stuck unclean", @"recovery 5/10 objects degraded (50.000%)", @"noout flag(s) set"];
}

@end
