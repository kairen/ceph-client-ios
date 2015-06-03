//
//  OSDModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@interface OSDModel : BaseModel

- (void)addObjectStorageMetadata:(NSDictionary *)metadata withID:(NSInteger) identity;
+ (NSArray *)keyTitles;

@property (nonatomic, strong) NSMutableDictionary *hostNames;

@property (nonatomic) NSInteger identity;
@property (nonatomic) CGFloat weight;

@property (nonatomic, copy) NSString *clusterIP;
@property (nonatomic, copy) NSString *publicIP;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *uuid;

@end
