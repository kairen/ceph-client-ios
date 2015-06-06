//
//  RESTCephClient.m
//  RESTCephClient
//
//  Created by KaiRen.Bai on 2015/5/25.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "RESTClient.h"
#import "SVProgressHUD.h"

typedef void(^RESTSuccessBlock)(NSURLSessionDataTask *task, id responseObject);

static NSTimeInterval const RESTRequestTimeout = 6 ;
static NSTimeInterval const RESTRequestDelayTime = 1 * NSEC_PER_SEC;
static NSString * const RESTAlertGetTitle = @"HTTP GET Status";
static NSString * const RESTAlertPutTitle = @"HTTP PUT Status";
static NSString * const RESTAlertPostTitle = @"HTTP POST Status";
static NSString * const RESTAlertDeleteTitle = @"HTTP DELETE Status";

@implementation RESTClient

/**
 *  Singleton Method
 *
 *  @return singleton instance
 */
+ (RESTClient *)initInstaceWithServerDomain:(NSString *)serverDomain {
    static id client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[RESTClient alloc] initWithBaseURL:[NSURL URLWithString:serverDomain]];
    });
    return client;
}

+ (RESTClient *)shareInstance {
    return [RESTClient initInstaceWithServerDomain:nil];
}

/**
 *  Init base http requster
 *
 *  @param url It is a server ip address or domain name
 *
 *  @return ceph client instance
 */
- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.requestSerializer.timeoutInterval = RESTRequestTimeout;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}

/**
 *  Request Factory Method
 *
 *  @param url        It is request url.
 *  @param method     It is HTTP GET/POST/PUT/DELETE.
 *  @param parameters It is user infos.
 *  @param success    It is success call func block.
 */
- (void)requestURL:(NSString *)url method:(RESTRequestMethod)method parameters:(id)parameters success:(RESTResponse)response {
    
    NSAssert(self.restapiBaseURL != nil, @"You must set base url");
    
    NSString *apiURL = [self.restapiBaseURL stringByAppendingPathComponent:url];
    NSLog(@"URL : %@", apiURL);
    
    typeof(self) __weak weakSelf = self;
    [SVProgressHUD show];
    [SVProgressHUD showWithStatus:@"Loading ..." maskType:SVProgressHUDMaskTypeBlack];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)RESTRequestDelayTime), dispatch_get_main_queue(), ^{
        switch (method) {
            case RESTRequestGET: {
                // GET Method
                [weakSelf GET:apiURL parameters:parameters success:^(NSURLSessionDataTask *task, id object) {
                    if([weakSelf checkingResponseObj:object] && response) {
                        response(object);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    [weakSelf showAlertWithTitle:RESTAlertGetTitle message:error.localizedDescription];
                }];
            } break;
            case RESTRequestPOST: {
                // POST Method
                [weakSelf POST:apiURL parameters:parameters success:^(NSURLSessionDataTask *task, id object) {
                    if([weakSelf checkingResponseObj:object] && response) {
                        response(object);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    [weakSelf showAlertWithTitle:RESTAlertPostTitle message:error.localizedDescription];
                }];
            } break;
            case RESTRequestPUT: {
                // PUT Method
                [weakSelf PUT:apiURL parameters:parameters success:^(NSURLSessionDataTask *task, id object) {
                    if([weakSelf checkingResponseObj:object] && response) {
                        response(object);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    [weakSelf showAlertWithTitle:RESTAlertPutTitle message:error.localizedDescription];
                }];
            } break;
            case RESTRequestDelete: {
                // DELETE Method
                [weakSelf DELETE:apiURL parameters:parameters success:^(NSURLSessionDataTask *task, id object) {
                    if([weakSelf checkingResponseObj:object] && response) {
                        response(object);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    [weakSelf showAlertWithTitle:RESTAlertDeleteTitle message:error.localizedDescription];
                }];
            } break;
        }
    });
}

/**
 *  Checking response status
 *
 *  @param obj Ceph Cluster obj
 *
 *  @return  success or failed
 */
- (BOOL)checkingResponseObj:(id)obj {
    if([obj isKindOfClass:[NSDictionary class]] ) {
        if([((NSString *)obj[@"status"]) rangeOfString:@"Error"].location == NSNotFound) {
            [SVProgressHUD dismiss];
            return YES;
        }
        [self showAlertWithTitle:@"JSON Status" message:obj[@"status"]];
    }
    return NO;
}

/**
 *  Show error alert
 *
 *  @param title   It is a error title
 *  @param message It is a error message
 */
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message {
    [SVProgressHUD dismiss];
    UIAlertView *messageAlert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
    [messageAlert show];
}

- (void)setRequestFormat:(RESTDataFormatter)requestFormat {
    _requestFormat = requestFormat;
    switch (self.requestFormat) {
        case RESTJsonFormatter: {
            [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            self.responseSerializer = [AFJSONResponseSerializer serializer];
        } break;
        case RESTXmlFormatter: {
            [self.requestSerializer setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
            self.responseSerializer = [AFXMLParserResponseSerializer serializer];
        } break;
    }
}

@end
