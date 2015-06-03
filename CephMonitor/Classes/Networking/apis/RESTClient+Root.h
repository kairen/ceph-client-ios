//
//  RESTClient+root.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"

@interface RESTClient (root)

#pragma mark - Root apis get method calls
- (void)clusterUniqueIdentifierWithResponse:(RESTResponse)response;
- (void)clusterHealth:(BOOL)detail response:(RESTResponse)response;
- (void)clusterSpace:(BOOL)detail response:(RESTResponse)response;
- (void)clusterQuorumStatusWithCompletion:(RESTResponse)response;
- (void)clusterReport:(NSInteger)tag response:(RESTResponse)response;
- (void)clusterStatusWithResponse:(RESTResponse)response;

#pragma mark -  Root apis put method calls
- (void)clusterPutCompactWithResponse:(RESTResponse)response;

@end
