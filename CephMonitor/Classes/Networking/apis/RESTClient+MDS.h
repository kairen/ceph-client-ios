//
//  RESTClient+mds.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"

@interface RESTClient (mds)

#pragma mark - Metadata server apis get method calls
- (void)metadataServerCompatShowWithResponse:(RESTResponse)response;
- (void)metadataServerDumpEpoch:(NSInteger)epoch response:(RESTResponse)response;
- (void)metadataServerStateWithResponse:(RESTResponse)response;

#pragma mark - Metadata server apis put method calls

@end
