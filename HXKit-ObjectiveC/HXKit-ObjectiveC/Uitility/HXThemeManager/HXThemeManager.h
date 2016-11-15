//
//  HXThemeManager.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX
//  Copyright © 2016年 Caver. All rights reserved.
//


#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, HXThemeStyle) {
    HXThemeStyleDefault,
    HXThemeStyleOrange,
    HXThemeStyleDark,
    HXThemeStyleGraphical,
    HXThemeStyleBlack
};


@interface HXThemeManager : NSObject


@property (nonatomic, strong, readonly) UIColor *color;
@property (nonatomic, assign)      HXThemeStyle  style;


+ (instancetype)manager;

- (void)apply;
- (UIColor *)colorWithStyle:(HXThemeStyle)style;


@end


NS_ASSUME_NONNULL_END
