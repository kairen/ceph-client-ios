//
//  HealthModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthModel.h"

@implementation HealthModel

+ (NSArray *)healthListTitles {
    return @[@"HEALTH",
             @"OSD",
             @"MON",
             @"POOLS",
             @"PG STATUS",
             @"USAGE",
             @"HOSTS"];
}

+ (NSArray *)healthListImages {
    return @[@"Health_logo",
             @"OSD_logo",
             @"Monitor_logo",
             @"Pools_logo",
             @"PGStatus_logo",
             @"Usage_logo",
             @"Host_logo"];
}

+ (NSArray *)healthListStatusInfos {
    return @[@"WARNING", @"OK", @"OK", @"OK", @"OK", @"OK", @"OK"];
}

+ (NSArray *)healthListContentInfos {
    return @[@"OK", @"3/3", @"1/1", @"6", @"960/960", @"6.1Gb", @"4"];
}

+ (NSArray *)healthListSubContentInfos {
    return @[@"in 8 hours", @"In & Up", @"Quorum", @"Active", @"Active & Clean", @"1003.7GB", @"1 MON/3 OSD"];
}

@end
