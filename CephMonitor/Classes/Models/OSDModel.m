//
//  OSDModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "OSDModel.h"

@implementation OSDModel

- (void)mappingObjectWithIndex:(NSInteger)index {
    NSDictionary *dict = self.dict[@"osds"][index];
    self.identity = [dict[@"osd"] integerValue];
    self.weight = [dict[@"weight"] floatValue];
    self.publicIP = dict[@"public_addr"];
    self.clusterIP = dict[@"cluster_addr"];
    self.uuid = dict[@"uuid"];
    self.state = ([dict[@"up"] integerValue] == 1) ? @"up,":@"down,";
    self.state = [self.state stringByAppendingString: ([dict[@"in"] integerValue] == 1) ? @"in":@"out"];
}

- (void)addObjectStorageMetadata:(NSDictionary *)metadata withID:(NSInteger)identity {
    NSDictionary *dict = metadata[@"output"];
    if(!self.hostNames) {
        self.hostNames = [NSMutableDictionary dictionary];
    }
    
    if (![self.hostNames.allKeys containsObject:dict[@"hostname"]]) {
        [self.hostNames setObject:@[[NSString stringWithFormat:@"%ld", (long)identity]] forKey:dict[@"hostname"]];
    } else {
        NSMutableArray *ids = [NSMutableArray arrayWithArray:self.hostNames[dict[@"hostname"]]];
        [ids addObject:[NSString stringWithFormat:@"%ld", (long)identity]];
        [self.hostNames setObject:ids forKey:dict[@"hostname"]];
    }
}

+ (NSArray *)keyTitles {
    return @[@"叢集 IP 位置", @"公有 IP 位置", @"權重", @"狀態", @"UUID"];
}

- (NSInteger)count {
    return ((NSArray *)self.dict[@"osds"]).count;
}

@end
