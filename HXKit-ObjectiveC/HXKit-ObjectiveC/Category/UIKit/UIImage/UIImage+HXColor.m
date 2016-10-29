//
//  UIImage+HXColor.m
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 16/10/29.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import "UIImage+HXColor.h"


@implementation UIImage (HXColor)

+ (instancetype)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = [UIImage new];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
