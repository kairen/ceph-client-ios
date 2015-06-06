//
//  UIColor+Extra.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extra)

+ (UIColor *)colorWithIntegerRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpah;
+ (UIColor *)colorWithRGBHex:(NSString *)hex alpha:(CGFloat)alpah;

+ (UIColor *)colorFromStatus:(NSString *)status;

+ (UIColor *)pageBackgroudColor;
+ (UIColor *)customRedColor;
+ (UIColor *)customLightRedColor;
+ (UIColor *)customGreenColor;
+ (UIColor *)customBlueColor;
+ (UIColor *)customLightBlueColor;
+ (UIColor *)customAquaColor;
+ (UIColor *)customYellowColor;
+ (UIColor *)customNavyColor;
+ (UIColor *)customTealColor;
+ (UIColor *)customOliveColor;
+ (UIColor *)customOrangeColor;
+ (UIColor *)customFuchsiaColor;
+ (UIColor *)customPurpleColor;
+ (UIColor *)customGrayColor;
+ (UIColor *)customBlackColor;
+ (UIColor *)customHeaderBlackColor;
+ (UIColor *)customLightBlackColor;
+ (UIColor *)customShadowColor;

@end
