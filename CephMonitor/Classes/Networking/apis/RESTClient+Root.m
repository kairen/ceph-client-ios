//
//  RESTClient+root.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/26.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient+root.h"

@implementation RESTClient (root)

#pragma mark - Root apis get method calls

/**
 *  Get cluster fsid
 *
 *  @param response is a callback
 */
- (void)clusterUniqueIdentifierWithResponse:(RESTResponse)response {
    [self requestURL:@"/fsid" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Get cluster health
 *
 *  @param detail   show detail status
 *  @param response is a callback
 */
- (void)clusterHealth:(BOOL)detail response:(RESTResponse)response {
    NSString *url = (detail) ? @"/health?detail": @"/health";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Get cluster space
 *
 *  @param detail   show detail status
 *  @param response is a callback
 */
- (void)clusterSpace:(BOOL)detail response:(RESTResponse)response {
    NSString *url = (detail) ? @"/df?detail": @"/df";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Get cluster quorum status
 *
 *  @param response is a callback
 */
- (void)clusterQuorumStatusWithCompletion:(RESTResponse)response {;
    [self requestURL:@"/quorum_status" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Get cluster report (very large)
 *
 *  @param tag      Input tag to show detail message
 *  @param response is a callback
 */
- (void)clusterReport:(NSInteger)tag response:(RESTResponse)response {
    NSString *url = (tag) ? [NSString stringWithFormat:@"/report?tag=%ld", tag]: @"/report";
    [self requestURL:url method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

/**
 *  Get cluster status
 *
 *  @param response is a callback
 */
- (void)clusterStatusWithResponse:(RESTResponse)response {
    [self requestURL:@"/status" method:RESTRequestGET parameters:nil success:^(id responseObject) {
        response(responseObject);
    }];
}

#pragma mark -  Root apis put method calls

- (void)clusterPutCompactWithResponse:(RESTResponse)response {
    
}

@end
