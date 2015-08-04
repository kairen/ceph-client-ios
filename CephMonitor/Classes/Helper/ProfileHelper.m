//
//  ProfileHelper.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/8.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "ProfileHelper.h"

static NSString * const kProfileAddressKey = @"AddressKey";

@implementation ProfileHelper

- (void)saveDomainAddress:(NSString *)address {
    [self setValue:kProfileAddressKey forKey:address];
    [self synchronize];
}

- (NSString *)domainAddress {
    if([self checkValueForKey:kProfileAddressKey]) {
        return [self objectForKey:kProfileAddressKey];
    } else {
        [self setValue:kProfileAddressKey forKey:@""];
        [self synchronize];
        return @"";
    }
}


- (BOOL)checkValueForKey:(NSString *)key {
    return ([self objectForKey:key] != nil);
}

@end
