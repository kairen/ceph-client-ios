//
//  RESTClient+mon.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"

@interface RESTClient (mon)

#pragma mark - Monitor apis get method calls
- (void)monitorDumpEpoch:(NSInteger)epoch response:(RESTResponse)response;
- (void)monitorStatusWithResponse:(RESTResponse)response;

#pragma mark - Metadata server apis put method calls

@end
