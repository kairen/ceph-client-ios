//
//  MonitorModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@interface MonitorModel : BaseModel

+ (NSDictionary *)monitorKeys;
+ (NSArray *)moitorName;
+ (NSArray *)monitorInfo;

@end
