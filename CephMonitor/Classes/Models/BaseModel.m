//
//  BaseModel.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (instancetype) createModelWithArray:(NSArray *)array {
    return [[[self class] alloc] initWithResponseObject:array];
}

+ (instancetype) createModelWithDict:(NSDictionary *)dict {
    return [[[self class] alloc] initWithResponseObject:dict];
}

- (instancetype)initWithResponseObject:(id)object {
    self = [super init];
    if(self) {
        if([object isKindOfClass:[NSDictionary class]]) {
            self.dict = object[@"output"];
        } else {
            
        }
    }
    return self;
}

- (void)mappingObjectWithIndex:(NSInteger)index {
    
}

@end
