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


@property (nonatomic, assign)           HXThemeStyle  themeStyle;
@property (nonatomic, strong, readonly)      UIColor *themeColor;


+ (instancetype)share;

- (void)apply;
- (UIColor *)themeColorWithStyle:(HXThemeStyle)themeStyle;


@end

NS_ASSUME_NONNULL_END
