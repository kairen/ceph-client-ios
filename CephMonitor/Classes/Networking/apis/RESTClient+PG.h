//
//  RESTClient+pg.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"

@interface RESTClient (pg)

#pragma mark - Placement of Groups apis get method calls
- (void)placemnetGroupDumpContents:(NSString *)content response:(RESTResponse)response;
- (void)placemnetGroupDumpPoolsWithResponse:(RESTResponse)response;
- (void)placemnetGroupDumpStuck:(NSString *)stuck response:(RESTResponse)response;
- (void)placemnetGroupMappinID:(NSInteger )pgid response:(RESTResponse)response;
- (void)placemnetGroupStateWithResponse:(RESTResponse)response;

#pragma mark - Metadata server apis put method calls

@end
