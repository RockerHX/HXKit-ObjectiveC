//
//  HXThemeManager.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX
//  Copyright © 2016年 Caver. All rights reserved.
//


#import "HXThemeManager.h"


static NSString *SelectedThemeKey = @"SelectedTheme";


@implementation HXThemeManager


@synthesize themeColor = _themeColor;


#pragma mark - Init Methods
+ (instancetype)manager {
    static HXThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[HXThemeManager alloc] init];
    });
    return manager;
}

#pragma mark - Setter And Getter
- (HXThemeStyle)themeStyle {
    HXThemeStyle theme = [[[NSUserDefaults standardUserDefaults] valueForKey:SelectedThemeKey] integerValue];
    return theme;
}

- (void)setStyle:(HXThemeStyle)style {
    _style = style;
    [self apply];
}

- (UIColor *)themeColor {
    return [self themeColorWithStyle:_style];
}

#pragma mark - Public Methods
- (void)apply {
    [[NSUserDefaults standardUserDefaults] setValue:@(_style) forKey:SelectedThemeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[UITabBar appearance] setTintColor:self.themeColor];
}

- (UIColor *)themeColorWithStyle:(HXThemeStyle)themeStyle {
    UIColor *color = nil;
    switch (themeStyle) {
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
