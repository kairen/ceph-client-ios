//
//  UIColor+Extra.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "UIColor+Extra.h"

@implementation UIColor (Extra)

+ (UIColor *)colorWithIntegerRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255 green:green / 255 blue:blue / 255 alpha:alpha];
}

+ (UIColor *)colorWithRGBHex:(NSString *)hex alpha:(CGFloat)alpah {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setScanLocation:([hex rangeOfString:@"#"].location != NSNotFound) ? 1:0];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpah];
}

+ (UIColor *)customRedColor {
    return [UIColor colorWithRGBHex:@"#dd4b39" alpha:1.0];
}

+ (UIColor *)pageBackgroudColor {
    return [UIColor colorWithRGBHex:@"#C8CCD7" alpha:1.0];
}

+ (UIColor *)customGreenColor {
    return [UIColor colorWithRGBHex:@"#00a65a" alpha:1.0];
}

@end
