//
//  PoolsModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/7.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@interface PoolsModel : BaseModel

+ (NSDictionary *)poolKeys;
+ (NSArray *)poolName;
+ (NSArray *)poolInfo;

@end
