//
//  HealthViewFlowLayout.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/6.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "HealthViewFlowLayout.h"

@implementation HealthViewFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}

@end
