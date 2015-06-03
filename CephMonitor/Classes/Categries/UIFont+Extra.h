//
//  UIFont+Extra.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extra)

+ (UIFont *)fontHelveticaNeueBoldSize:(CGFloat)size;
+ (UIFont *)fontHelveticaNeueLightSize:(CGFloat)size;

+ (NSDictionary *)bmiLightAttrubutes;
+ (NSDictionary *)lightAttrubutesSize:(CGFloat)size;
+ (NSDictionary *)boldAttrubutesSize:(CGFloat)size;
@end
