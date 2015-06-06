//
//  HealthModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@interface HealthModel : BaseModel

+ (NSArray *)healthListTitles;
+ (NSArray *)healthListImages;

+ (NSArray *)healthListStatusInfos;
+ (NSArray *)healthListContentInfos;
+ (NSArray *)healthListSubContentInfos;

@end
