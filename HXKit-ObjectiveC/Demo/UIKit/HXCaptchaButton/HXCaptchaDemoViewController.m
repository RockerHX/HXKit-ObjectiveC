//
//  HXCaptchaDemoViewController.m
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 16/10/15.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import "HXCaptchaDemoViewController.h"
#import "HXCaptchaButton.h"


@interface HXCaptchaDemoViewController ()
@end


@implementation HXCaptchaDemoViewController


#pragma mark - View Controller Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    // Default Duration.
//    [_button timing:^BOOL(HXCaptchaButton *button) {
//        NSLog(@"Timing Started.");
//        return YES;
//    } end:^(HXCaptchaButton *button) {
//        NSLog(@"Timing Ended.");
//    }];
    
    // Timing With Duration.
    [_button timingWithDuration:10 start:^BOOL(HXCaptchaButton *button) {
        NSLog(@"Timing Started.");
        return YES;
    } end:^(HXCaptchaButton *button) {
        NSLog(@"Timing Ended.");
    }];
}


@end
