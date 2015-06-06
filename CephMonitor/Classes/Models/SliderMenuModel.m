//
//  SliderMenuDatas.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "SliderMenuModel.h"

@implementation SliderMenuModel

+ (NSArray *)sliderMenuHeaderTitles {
    return @[@"叢集Monitoring", @"叢集Managing", @"設定"];
}

+ (NSArray *)sliderMenuHeaderIcons {
    return @[@"ClusterMonitor_logo", @"ClusterManage_logo", @"Setting_logo"];
}

+ (NSArray *)sliderMenuContentTitles {
    return @[[SliderMenuModel sliderMenuMonitorTitles], [SliderMenuModel sliderMenuManageTitles], [SliderMenuModel sliderMenuSettingsTitles]];
}


+ (NSArray *)sliderMenuMonitorTitles {
    return @[@"叢集整體健康狀態", @"叢集OSD資訊", @"叢集MON資訊", @"叢集POOL資訊", @"叢集MDS資訊", @"叢集效能資訊"];
}

+ (NSArray *)sliderMenuManageTitles {
    return @[@"OSD參數設定", @"MON參數設定", @"POOL參數設定", @"PG參數設定"];
}

+ (NSArray *)sliderMenuSettingsTitles {
    return @[@"Log", @"登出"];
}



@end
