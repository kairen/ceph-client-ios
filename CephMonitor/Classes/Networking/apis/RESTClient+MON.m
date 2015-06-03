//
//  RESTClient+mon.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient+mon.h"

@implementation RESTClient (mon)

#pragma mark - Monitor apis get method calls

/**
 *  Dump formatted monmap
 *
 *  @param epoch
 *  @param response is a callback
 */
- (void)monitorDumpEpoch:(NSInteger)epoch response:(RESTResponse)response {
    NSString *url = (epoch)? [NSString stringWithFormat:@"/mon/dump?epoch=%ld", (long)epoch]: @"/mon/dump";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Report status of monitors
 *
 *  @param response is a callback
 */
- (void)monitorStatusWithResponse:(RESTResponse)response {
    [self requestURL:@"mon_status" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

@end
