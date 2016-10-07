//
//  UIImage+Loaded.m
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 16/10/7.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import "UIImage+Loaded.h"
#import <objc/runtime.h>


@implementation UIImage (Loaded)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method imageNamed = class_getClassMethod(self, @selector(imageNamed:));
        Method hx_imageNamed = class_getClassMethod(self, @selector(hx_imageNamed:));
        
        method_exchangeImplementations(hx_imageNamed, imageNamed);
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
