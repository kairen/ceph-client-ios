//
//  ProfileHelper.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/8.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProfileHelper : NSUserDefaults

- (void)saveDomainAddress:(NSString *)address;
- (NSString *)domainAddress;

@end
