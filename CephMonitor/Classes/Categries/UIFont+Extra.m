//
//  UIFont+Extra.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/4/13.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "UIFont+Extra.h"

@implementation UIFont (Extra)

+ (UIFont *)fontHelveticaNeueBoldSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont *)fontHelveticaNeueLightSize:(CGFloat)size {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

+ (NSDictionary *)bmiLightAttrubutes {
    return @{NSFontAttributeName:[UIFont fontHelveticaNeueBoldSize:24],
             NSForegroundColorAttributeName:[UIColor whiteColor]};
}

+ (NSDictionary *)lightAttrubutesSize:(CGFloat)size {
    return @{NSFontAttributeName:[UIFont fontHelveticaNeueLightSize:size],
             NSForegroundColorAttributeName:[UIColor whiteColor]};
}

+ (NSDictionary *)boldAttrubutesSize:(CGFloat)size {
    return @{NSFontAttributeName:[UIFont fontHelveticaNeueBoldSize:size], NSForegroundColorAttributeName:[UIColor whiteColor]};
}

@end
