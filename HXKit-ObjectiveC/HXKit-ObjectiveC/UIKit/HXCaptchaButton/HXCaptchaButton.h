//
//  HXCaptchaButton.h
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 14/12/31.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HXSecurityType) {
    HXSecurityTypeMessage,
    HXSecurityTypeCall
};

@interface HXCaptchaButton : UIButton

@property (nonatomic, assign) HXSecurityType type;
@property (nonatomic, assign) NSTimeInterval duration;

/**
 *  点击事件回调方法 - 当SCVerificationCodeLabel被点击的时候，触发此回调
 */
- (void)timingStart:(BOOL(^)(HXCaptchaButton *button))start
                end:(void(^)(HXCaptchaButton *button))end;

/**
 *  停止计时，用于网络信号不好等时候无法获取验证码的时候，重新获取验证码
 */
- (void)stop;

@end
