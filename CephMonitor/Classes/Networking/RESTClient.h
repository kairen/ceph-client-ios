//
//  RESTCephClient.h
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef NS_ENUM(NSInteger, RESTRequestMethod) {
    RESTRequestGET = 0,
    RESTRequestPOST,
    RESTRequestPUT,
    RESTRequestDelete
};

typedef NS_ENUM(NSInteger, RESTDataFormatter) {
    RESTJsonFormatter = 0,
    RESTXmlFormatter
};

typedef void(^RESTResponse)(id responseObject);

@interface RESTClient : AFHTTPSessionManager

+ (RESTClient *)initInstaceWithServerDomain:(NSString *)serverDomain;
+ (RESTClient *)shareInstance;

- (void)requestURL:(NSString *)url method:(RESTRequestMethod)method parameters:(id)parameters success:(RESTResponse)response;
- (void) setUsername:(NSString *)username passwd:(NSString *)passwd;

@property(nonatomic, copy) NSString *restapiBaseURL;
@property (nonatomic, copy) NSString *domain;
@property(nonatomic, assign) RESTDataFormatter requestFormat;

@end
