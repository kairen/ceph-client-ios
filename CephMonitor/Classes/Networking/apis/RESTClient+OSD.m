//
//  RESTClient+osd.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient+osd.h"

@implementation RESTClient (osd)

#pragma mark - Object storage deamon apis get method calls

/**
 *  Show blacklisted clients
 *
 *  @param response is a callback
 */
- (void)objectStorageBlackListWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/blacklist/ls" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Show all OSD ids
 *
 *  @param response is a callback
 */
- (void)objectStorageOverallIdWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/ls" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Print dump of OSD perf summary stats
 *
 *  @param response is a callback
 */
- (void)objectStoragePerformanceWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/perf" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Print summary of OSD map
 *
 *  @param response is a callback
 */
- (void)objectStorageStateWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/stat" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Print OSD tree
 *
 *  @param response is a callback
 */
- (void)objectStorageTreeWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/tree" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Print summary of OSD map
 *
 *  @param epoch
 *  @param response is a callback
 */
- (void)objectStorageDumpEpoch:(NSInteger)epoch response:(RESTResponse)response {
    NSString *url = (epoch)? [NSString stringWithFormat:@"/osd/dump?epoch=%ld", epoch]: @"/osd/dump";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Find osd <id> in the CRUSH map and show its location
 *
 *  @param osdId    is a osd id
 *  @param response is a callback
 */
- (void)objectStorageFind:(NSInteger)osdId response:(RESTResponse)response {
    NSString *url = [NSString stringWithFormat:@"/osd/find?id=%ld", osdId];
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Dump crush all rule
 *
 *  @param response is a callback
 */
- (void)objectStorageCrushDumpWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/crush/dump" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Dump crush rule <name> (default all)
 *
 *  @param crushName
 *  @param response  is a callback
 */
- (void)objectStorageDumpCrushRule:(NSString *)crushName response:(RESTResponse)response {
    NSString *url = (crushName)? [NSString stringWithFormat:@"/osd/crush/rule/dump?name=%@", crushName]: @"/osd/crush/rule/dump";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  List crush rules
 *
 *  @param response is a callback
 */
- (void)objectStorageCrushRuleListWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/crush/rule/list" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Obtain stats from all pools, or from specified pool
 *
 *  @param response is a callback
 */
- (void)objectStoragePoolStatusWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/pool/stats" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Fet pool parameter <var>
 *
 *  @param name is a pool name
 *  @param var  size | min_size | crash_replay_interval | pg_num | pgp_num | crush_ruleset |
 *              hit_set_type | hit_set_period | hit_set_count|hit_set_fpp | auid |
 *              target_max_objects | target_max_bytes | cache_target_dirty_ratio |
 *              cache_target_full_ratio | cache_min_flush_age | cache_min_evict_age |
 *              erasure_code_profile | min_read_recency_for_promote | write_fadvise_dontneed
 *
 *  @param response is a callback
 */
- (void)objectStoragePoolName:(NSString *)name variable:(NSString *)var response:(RESTResponse)response {
    NSString *url = [NSString stringWithFormat:@"/osd/pool/get?pool=%@&var=%@", name, var];
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  List pools
 *
 *  @param response is a callback
 */
- (void)objectStoragePoolsWithResponse:(RESTResponse)response {
    [self requestURL:@"/osd/lspools" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

@end
