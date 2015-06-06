//
//  SliderMenuViewController.h
//  CephMonitor
//
//  Created by Wu~ on 2015/6/2.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, SliderMenuMonitorType) {
    SliderMenuHealthMonitor = 0,
    SliderMenuObjectStorageMonitor = 0,
    SliderMenuMonitorDeamonMonitor = 0,
    SliderMenuPoolMonitor = 0,
    SliderMenuMetadataServerMonitor = 0,
    SliderMenuPerformancdMonitor = 0,
};

typedef NS_ENUM(NSInteger, SliderMenuManageType) {
    SliderMenuObjectStorageManage = 0,
    SliderMenuMonitorDeamonManage,
    SliderMenuPoolManage,
    SliderMenuPGsManage,
};

typedef NS_ENUM(NSInteger, SliderMenuSettingsType) {
    SliderMenuSettingsSystemLog = 0,
    SliderMenuSettingsLogout
};

@interface SliderMenuViewController : UIViewController 



@end
