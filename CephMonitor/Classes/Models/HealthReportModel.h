//
//  HealthReportModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthModel.h"

@interface HealthReportModel : HealthModel

+ (NSArray *)severityDatas;
+ (NSArray *)detailsDatas;


@end
