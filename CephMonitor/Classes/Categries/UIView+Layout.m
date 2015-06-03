//
//  UIView+Layout.m
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "UIView+Layout.h"

static CGFloat const UIAutoScaleX[] = {
    1, 1.171875, 1.29375
};

static CGFloat const UIAutoScaleY[] = {
    1, 1.17429577, 1.2957
};

@implementation UIView (Layout)

- (CGRect)scaleMakeX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
    CGRect frame = self.frame;
    CGFloat scaleX, scaleY;
    if(CGRectGetHeight(frame) <= 568) {
        scaleX =  UIAutoScaleX[0]; scaleY = UIAutoScaleY[0];
    } else if(CGRectGetHeight(frame) >= 568 && CGRectGetHeight(frame) <= 667) {
        scaleX =  UIAutoScaleX[1]; scaleY = UIAutoScaleY[1];
    } else {
        scaleX =  UIAutoScaleX[2]; scaleY = UIAutoScaleY[2];
    }
    CGRect rect;
    rect.origin.x = x * scaleX;
    rect.origin.y = y * scaleY;
    rect.size.width = width * scaleX;
    rect.size.height = height * scaleY;
    return rect;
}

- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}

- (CGSize)size {
    return self.frame.size;
}

- (KeyboardDevice)getKeyboardDevice {
    CGRect frame = [UIScreen mainScreen].bounds;
    if(CGRectGetHeight(frame) <= 568) {
        return KeyboardiPhone5;
    } else if(CGRectGetHeight(frame) >= 568 && CGRectGetHeight(frame) <= 667) {
        return KeyboardiPhone6;
    }
    return KeyboardiPhonePlus;
}


@end
