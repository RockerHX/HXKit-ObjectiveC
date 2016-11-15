//
//  HXThemeManager.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX
//  Copyright © 2016年 Caver. All rights reserved.
//


#import "HXThemeManager.h"


static NSString *HXSelectedThemeKey = @"HXSelectedThemeKey";


@implementation HXThemeManager


#pragma mark - Singleton Methods
+ (instancetype)manager {
    static HXThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HXThemeManager alloc] init];
    });
    return manager;
}

#pragma mark - Property
- (HXThemeStyle)themeStyle {
    HXThemeStyle theme = [[[NSUserDefaults standardUserDefaults] valueForKey:HXSelectedThemeKey] integerValue];
    return theme;
}

- (void)setStyle:(HXThemeStyle)style {
    _style = style;
    [self apply];
}

- (UIColor *)color {
    return [self colorWithStyle:_style];
}

#pragma mark - Public Methods
- (void)apply {
    [[NSUserDefaults standardUserDefaults] setValue:@(_style) forKey:HXSelectedThemeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[UITabBar appearance] setTintColor:self.color];
}

- (UIColor *)colorWithStyle:(HXThemeStyle)style {
    UIColor *color = nil;
    switch (style) {
        case HXThemeStyleOrange: {
            color = [UIColor colorWithRed:252.0f/255.0f green:139.0f/255.0f blue:69.0f/255.0f alpha:1.0f];
            break;
        }
        case HXThemeStyleDark: {
            color = [UIColor colorWithRed:242.0f/255.0f green:101.0f/255.0f blue:34.0f/255.0f alpha:1.0f];
            break;
        }
        case HXThemeStyleGraphical: {
            color = [UIColor colorWithRed:10.0f/255.0f green:10.0f/255.0f blue:10.0f/255.0f alpha:1.0f];
            break;
        }
        case HXThemeStyleBlack: {
            color = [UIColor blackColor];
            break;
        }
            
        default: {
            color = [UIApplication sharedApplication].keyWindow.tintColor;
            break;
        }
    }
    return color;
}

@end
