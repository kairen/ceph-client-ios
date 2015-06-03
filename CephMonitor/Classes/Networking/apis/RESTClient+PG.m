//
//  RESTClient+pg.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient+pg.h"

@implementation RESTClient (pg)

#pragma mark - Placement of Groups apis get method calls

/**
 *  Show human-readable version of pg map
 *
 *  @param content  all | summary | sum | delta | pools | osds | pgs | pgs_brief
 *  @param response is a callback
 */
- (void)placemnetGroupDumpContents:(NSString *)content response:(RESTResponse)response {
    NSString *url = (content)? [NSString stringWithFormat:@"/pg/dump?dumpcontents=%@", content]: @"/pg/dump";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show pg pools info in json only
 *
 *  @param response is a callback
 */
- (void)placemnetGroupDumpPoolsWithResponse:(RESTResponse)response {
    [self requestURL:@"/pg/dump_pools_json" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show pg pools info in json only
 *
 *  @param stuck    inactive | unclean | stale | undersized | degraded
 *  @param response is a callback
 */
- (void)placemnetGroupDumpStuck:(NSString *)stuck response:(RESTResponse)response {
    NSString *url = (stuck)? [NSString stringWithFormat:@"/pg/dump_stuck?stuckops=%@", stuck]: @"/pg/dump_stuck";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show mapping of pg to osds
 *
 *  @param pgid     is pg id, u can get from dump_pool api
 *  @param response is a callback
 */
- (void)placemnetGroupMappinID:(NSInteger )pgid response:(RESTResponse)response {
    NSString *url = [NSString stringWithFormat:@"/pg/map?pgid=%ld", (long)pgid];
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show placement group status.
 *
 *  @param response is a callback
 */
- (void)placemnetGroupStateWithResponse:(RESTResponse)response {
    [self requestURL:@"/pg/stat" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

@end
