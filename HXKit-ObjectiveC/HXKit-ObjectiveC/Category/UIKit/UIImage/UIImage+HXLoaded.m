//
//  UIImage+HXLoaded.m
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 16/10/7.
//  Copyright © 2016年 Caver. All rights reserved.
//


#import "UIImage+HXLoaded.h"
#import "NSObject+HXSwizzling.h"


@implementation UIImage (HXLoaded)


+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hx_swizzleMethod:@selector(imageNamed:) withMethod:@selector(hx_imageNamed:)];
    });
}

+ (instancetype)hx_imageNamed:(NSString *)name {
    
    UIImage *image = [self hx_imageNamed:name];
    if (!image) {
        NSLog(@"~~~~~~~~图片素材 **[ %@ ]** 加载出错~~~~~~~~", name);
    }
    
    return image;
}


@end
