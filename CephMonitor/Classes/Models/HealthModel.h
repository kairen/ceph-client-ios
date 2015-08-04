//
//  HealthModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@interface HealthModel : BaseModel

@property (nonatomic, copy) NSString *overall_status;
@property (nonatomic, copy) NSArray *healthMessages;
@property (nonatomic, copy) NSArray *healthListStatusInfos;
@property (nonatomic, copy) NSArray *healthListContentInfos;
@property (nonatomic, copy) NSArray *healthCounts;
@property (nonatomic, copy) NSArray *summary;

+ (NSArray *)healthListTitles;
+ (NSArray *)healthListImages;

+ (NSArray *)healthListSubContentInfos;

@end
