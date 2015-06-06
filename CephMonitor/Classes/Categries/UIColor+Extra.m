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

+ (UIColor *)colorFromStatus:(NSString *)status {
    if ([status isEqualToString:@"OK"]) {
        return [UIColor colorWithRGBHex:@"#00A65A" alpha:1.0];
    }
    else if ([status isEqualToString:@"WARN"]) {
        return [UIColor colorWithRGBHex:@"#EBA709" alpha:1.0];
    }
    else if ([status isEqualToString:@"ERROR"]) {
        return [UIColor colorWithRGBHex:@"#CD2626" alpha:1.0];
    }
    else {
        return [UIColor colorWithRGBHex:@"#3275C1" alpha:1.0];
    }
}

+ (UIColor *)pageBackgroudColor {
    return [UIColor colorWithRGBHex:@"#E5EBEF" alpha:1.0];
}

+ (UIColor *)customRedColor {
    return [UIColor colorWithRGBHex:@"#AA2626" alpha:1.0];
}

+ (UIColor *)customGreenColor {
    return [UIColor colorWithRGBHex:@"#00a65a" alpha:1.0];
}

+ (UIColor *)customBlueColor {
    return [UIColor colorWithRGBHex:@"#0073b7" alpha:1.0];
}

+ (UIColor *)customLightBlueColor {
    return [UIColor colorWithRGBHex:@"#3c8dbc" alpha:1.0];
}

+ (UIColor *)customAquaColor {
    return [UIColor colorWithRGBHex:@"#00c0ef" alpha:1.0];
}

+ (UIColor *)customYellowColor {
    return [UIColor colorWithRGBHex:@"#f39c12" alpha:1.0];
}

+ (UIColor *)customNavyColor {
    return [UIColor colorWithRGBHex:@"#001F3F" alpha:1.0];
}

+ (UIColor *)customTealColor {
    return [UIColor colorWithRGBHex:@"#39CCCC" alpha:1.0];
}

+ (UIColor *)customOliveColor {
    return [UIColor colorWithRGBHex:@"#3D9970" alpha:1.0];
}

+ (UIColor *)customOrangeColor {
    return [UIColor colorWithRGBHex:@"#FF851B" alpha:1.0];
}

+ (UIColor *)customFuchsiaColor {
    return [UIColor colorWithRGBHex:@"#F012BE" alpha:1.0];
}

+ (UIColor *)customPurpleColor {
    return [UIColor colorWithRGBHex:@"#605ca8" alpha:1.0];
}

+ (UIColor *)customGrayColor {
    return [UIColor colorWithRGBHex:@"#d2d6de" alpha:1.0];
}

+ (UIColor *)customBlackColor {
    return [UIColor colorWithRGBHex:@"#222D32" alpha:1.0];
}

+ (UIColor *)customHeaderBlackColor {
    return [UIColor colorWithRGBHex:@"#1A2226" alpha:1.0];
}

+ (UIColor *)customLightBlackColor {
    return [UIColor colorWithRGBHex:@"#535353" alpha:1.0];
}

+ (UIColor *)customShadowColor {
    return [UIColor colorWithRGBHex:@"#CED4DC" alpha:1.0];
}

@end
