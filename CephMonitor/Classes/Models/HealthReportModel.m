//
//  HealthReportModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthReportModel.h"

@implementation HealthReportModel


- (void)mappingObject {
    NSMutableArray *severitys = [NSMutableArray array];
    for(NSDictionary *dict in self.array) {
        [severitys addObject:dict[@"severity"]];
    }
    self.severityDatas = severitys;
    NSMutableArray *details = [NSMutableArray array];
    for(NSDictionary *dict in self.array) {
        [details addObject:dict[@"summary"]];
    }
    self.detailsDatas = details;
}

@end
