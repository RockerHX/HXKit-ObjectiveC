//
//  HXCaptchaButton.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import <UIKit/UIKit.h>


// Must use UIButtonTypeCustom, If not count down will be flickering.
@interface HXCaptchaButton : UIButton


@property (nonatomic, assign) NSTimeInterval  duration;      // Default is 60s
@property (nonatomic, strong) NSString       *prompt;        // Captcha Button Prompt


- (void)timing:(BOOL(^)(HXCaptchaButton *button))start
           end:(void(^)(HXCaptchaButton *button))end;

- (void)timingWithDuration:(NSTimeInterval)duration
                     start:(BOOL(^)(HXCaptchaButton *button))start
                       end:(void(^)(HXCaptchaButton *button))end;

- (void)stop;


@end
