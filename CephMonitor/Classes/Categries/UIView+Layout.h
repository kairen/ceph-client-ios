//
//  UIView+Layout.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KeyboardDevice) {
    KeyboardiPhone5 = 255,
    KeyboardiPhone6 = 260,
    KeyboardiPhonePlus = 273
};

@interface UIView (Layout)

- (CGFloat)minX;
- (CGFloat)minY;
- (CGFloat)midX;
- (CGFloat)midY;
- (CGFloat)maxX;
- (CGFloat)maxY;
- (CGFloat)width;
- (CGFloat)height;

- (CGSize)size;
- (CGRect)scaleMakeX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;

- (KeyboardDevice) getKeyboardDevice;
@end
