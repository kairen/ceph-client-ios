//
//  UIImage+Extra.h
//  FitnessApp
//
//  Created by KaiRen.Bai on 2015/3/23.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extra)

+ (UIImage*)loadFileImageName:(NSString*)name;
+ (UIImage *)fitImage:(NSString *)imageName size:(CGSize)newSize;
- (UIImage *)resize:(CGSize)newSize;

- (UIImage *)boxblurImageWithBlur:(CGFloat)blur;

@end
