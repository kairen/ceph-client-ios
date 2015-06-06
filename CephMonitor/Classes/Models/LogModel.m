//
//  LogModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/5.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "LogModel.h"

@implementation LogModel

+ (NSArray *)logDate {
    return @[@"5/28/2015 22:05:81 +0800 mon.0 192.168.0.8:6789/0 1880",
             @"5/28/2015 22:05:77 +0800 mon.0 192.168.0.8:6789/0 1879",
             @"5/28/2015 22:05:73 +0800 mon.0 192.168.0.8:6789/0 1878",
             @"5/28/2015 22:05:67 +0800 mon.0 192.168.0.8:6789/0 1877",
             @"5/28/2015 21:05:63 +0800 mon.0 192.168.0.8:6789/0 1876",
             @"5/28/2015 21:05:57 +0800 mon.0 192.168.0.8:6789/0 1875",
             @"5/28/2015 21:05:54 +0800 mon.0 192.168.0.8:6789/0 1874",
             @"5/28/2015 21:05:50 +0800 mon.0 192.168.0.8:6789/0 1873",
             @"5/28/2015 21:05:44 +0800 mon.0 192.168.0.8:6789/0 1872",
             @"5/28/2015 21:05:41 +0800 mon.0 192.168.0.8:6789/0 1871",
             @"5/28/2015 21:05:31 +0800 mon.0 192.168.0.8:6789/0 1871"];
}

+ (NSArray *)logInfo {
    return @[@"[INF] pgmap v6052: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%); 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6051: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6050: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6049: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6048: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6047: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6046: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6045: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6044: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6043: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)",
             @"[INF] pgmap v6043: 960 pgs: 960 active+degraded+remapped; 12859 kB data, 0 kB used, 0 kB / 0 kB avail; 5/10 objects degraded (50.000%)"];
}

@end
