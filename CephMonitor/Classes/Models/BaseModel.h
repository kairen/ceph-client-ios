//
//  BaseModel.h
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

+ (instancetype)createModelWithDict:(NSDictionary *)dict;
+ (instancetype)createModelWithArray:(NSArray *)array;

- (void)mappingObjectWithIndex:(NSInteger)index;

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic) NSInteger count;

@end
