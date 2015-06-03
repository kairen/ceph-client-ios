//
//  RESTClient+osd.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"

@interface RESTClient (osd)

#pragma mark - Object storage deamon apis get method calls
- (void)objectStorageBlackListWithResponse:(RESTResponse)response;
- (void)objectStorageOverallIdWithResponse:(RESTResponse)response;
- (void)objectStoragePerformanceWithResponse:(RESTResponse)response;
- (void)objectStorageStateWithResponse:(RESTResponse)response;
- (void)objectStorageTreeWithResponse:(RESTResponse)response;
- (void)objectStorageDumpEpoch:(NSInteger)epoch response:(RESTResponse)response;
- (void)objectStorageFind:(NSInteger)osdId response:(RESTResponse)response;

- (void)objectStorageCrushDumpWithResponse:(RESTResponse)response;
- (void)objectStorageCrushRuleListWithResponse:(RESTResponse)response;
- (void)objectStorageDumpCrushRule:(NSString *)crushName response:(RESTResponse)response;

- (void)objectStoragePoolsWithResponse:(RESTResponse)response;
- (void)objectStoragePoolStatusWithResponse:(RESTResponse)response;
- (void)objectStoragePoolName:(NSString *)name variable:(NSString *)var response:(RESTResponse)response;

#pragma mark - Metadata server apis put method calls

@end
