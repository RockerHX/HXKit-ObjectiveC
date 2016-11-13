//
//  HXVersion.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX
//  Copyright © 2016年 Caver. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, HXSystemVersion) {
    HXSystemVersionTooOld,
    HXSystemVersionTooNew,
    HXSystemVersionIOS5,
    HXSystemVersionIOS6,
    HXSystemVersionIOS7,
    HXSystemVersionIOS8,
    HXSystemVersionIOS9,
    HXSystemVersionIOS10,
};

typedef NS_ENUM(NSUInteger, HXDeviceType) {
    HXDeviceTypeUnknown,
    HXDeviceTypeIPhone,
    HXDeviceTypeIPad,
    HXDeviceTypeIPhoneSimulator,
    HXDeviceTypeIPadSimulator,
};

typedef NS_ENUM(NSUInteger, HXDeviceMode) {
    HXDeviceModeUnknown,
    HXDeviceModeIPad,
    HXDeviceMode3_5Inch,
    HXDeviceMode4_0Inch,
    HXDeviceMode4_7Inch,
    HXDeviceMode5_5Inch,
    HXDeviceModeIphone4_4S = HXDeviceMode3_5Inch,
    HXDeviceModeIphone5_5S = HXDeviceMode4_0Inch,
    HXDeviceModeIphone5SPrior,
    HXDeviceModeIphone6 = HXDeviceMode4_7Inch,
    HXDeviceModeIphone6Plus = HXDeviceMode5_5Inch,
    HXDeviceModeIphone6s = HXDeviceMode4_7Inch,
    HXDeviceModeIphone6sPlus = HXDeviceMode5_5Inch,
    HXDeviceModeIphone7 = HXDeviceMode4_7Inch,
    HXDeviceModeIphone7Plus = HXDeviceMode5_5Inch,
};


@interface HXVersion : NSObject


/**
 *  获取App主版本号
 *
 *  @return 主版本号
 */
+ (NSString *)appVersion;

/**
 *  获取App构建版本号
 *
 *  @return 构建版本号
 */
+ (NSString *)appBuildVersion;

/**
 *  获取当前系统大版本
 *
 *  @return 系统大版本号
 */
+ (HXSystemVersion)systemVersion;

/**
 *  获取当前设备类型
 *
 *  @return 设备类型
 */
+ (HXDeviceType)deviceType;

/**
 *  获取当前机型
 *
 *  @return 设备机型
 */
+ (HXDeviceMode)currentModel;

/**
 *  当前设备是否是5S及其以前的设备
 */
+ (BOOL)isIPhone5SPrior;


@end
