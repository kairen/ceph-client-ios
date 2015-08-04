//
//  HealthModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthModel.h"

@implementation HealthModel

- (void) mappingObject {
    NSDictionary *health = self.dict[@"health"];
    self.overall_status = health[@"overall_status"];
    self.summary = health[@"summary"];
    
    NSDictionary *osdmap = self.dict[@"osdmap"][@"osdmap"];
    NSInteger osdUp = [osdmap[@"num_up_osds"] integerValue];
    NSInteger osdIn = [osdmap[@"num_in_osds"] integerValue];
    NSInteger osdCount = osdUp - osdIn;
    
    NSArray *mon = self.dict[@"monmap"][@"mons"];
    NSInteger monCount = mon.count;
    
    NSDictionary *pgmap = self.dict[@"pgmap"];
    NSInteger pg_num = [pgmap[@"num_pgs"] integerValue];
    NSInteger active_num = 0;
    
    for(NSDictionary *dict in pgmap[@"pgs_by_state"]) {
        if([dict[@"state_name"] isEqualToString:@"active+clean"]) {
            active_num = [dict[@"count"] integerValue];
        }
    }
    
    
    NSString *helthMsg = [self checkCount:self.summary.count];
    NSString *osdMsg = [self checkCount: osdCount];
    
    self.healthMessages = @[helthMsg,
                            osdMsg,
                            @"",
                            @"",
                            @"",
                            @"",
                            @""];
    
    self.healthCounts = @[@((self.summary.count > 0) ? 1 : 0),
                          @((osdCount > 0) ? 2:0),
                          @((monCount > 0) ? 0:2),
                          @(0),
                          @(0),
                          @(0),
                          @(0)];
    
    self.healthListStatusInfos = @[(self.summary.count > 0) ? @"WARNING" : @"OK",
                                   (osdCount > 0) ? @"ERROR" : @"OK",
                                   (monCount > 0) ? @"OK" : @"OK",
                                   @"OK",
                                   @"OK",
                                   @"OK",
                                   @"OK"];
    

    self.healthListContentInfos = @[([self.overall_status isEqualToString:@"HEALTH_WARN" ]? @"WARN" : @"OK"),
                                    [NSString stringWithFormat:@"%ld/%ld",osdIn ,osdUp],
                                    [NSString stringWithFormat:@"%ld/%ld",mon.count ,mon.count],
                                    @"8",
                                    [NSString stringWithFormat:@"%ld/%ld",active_num ,pg_num],
                                    @"6.1Gb",
                                    @"5"];
}

- (NSString *)checkCount:(NSInteger)count {
    return [NSString stringWithFormat:@"有『%ld』個錯誤訊息!", count];
}

+ (NSArray *)healthListTitles {
    return @[@"HEALTH",
             @"OSD",
             @"MON",
             @"POOLS",
             @"PG STATUS",
             @"USAGE",
             @"HOSTS"];
}

+ (NSArray *)healthListImages {
    return @[@"Health_logo",
             @"OSD_logo",
             @"Monitor_logo",
             @"Pools_logo",
             @"PGStatus_logo",
             @"Usage_logo",
             @"Host_logo"];
}

+ (NSArray *)healthListSubContentInfos {
    return @[@"in 2 hours", @"In & Up", @"Quorum", @"Active", @"Active & Clean", @"1003.7GB", @"2 MON/3 OSD"];
}

@end
