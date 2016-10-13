//
//  HXCaptchaButton.h
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 14/12/31.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HXCaptchaButton : UIButton


@property (nonatomic, assign) NSTimeInterval  duration;      // Default is 60s
@property (nonatomic, strong) NSString       *prompt;        // Captcha Button Prompt


- (void)timingWithDuration:(NSTimeInterval)duration
                     start:(BOOL(^)(HXCaptchaButton *button))start
                       end:(void(^)(HXCaptchaButton *button))end;

- (void)timing:(BOOL(^)(HXCaptchaButton *button))start
           end:(void(^)(HXCaptchaButton *button))end;

- (void)stop;


@end
