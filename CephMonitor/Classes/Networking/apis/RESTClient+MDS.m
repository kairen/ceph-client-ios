//
//  RESTClient+mds.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient+mds.h"

@implementation RESTClient (mds)

#pragma mark - Metadata server apis get method calls

/**
 *  Show mds compatibility settings
 *
 *  @param response is a callback
 */
- (void)metadataServerCompatShowWithResponse:(RESTResponse)response {
    [self requestURL:@"/mds/compat/show" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}


/**
 *  Dump info, optionally from epoch
 *
 *  @param epoch
 *  @param response is a callback
 */
- (void)metadataServerDumpEpoch:(NSInteger)epoch response:(RESTResponse)response {
    NSString *url = (epoch)? [NSString stringWithFormat:@"/mds/dump?epoch=%ld", (long)epoch]: @"/mds/dump";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show MDS status
 *
 *  @param response is a callback
 */
- (void)metadataServerStateWithResponse:(RESTResponse)response {
    [self requestURL:@"/mds/stat" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}


@end
