//
//  HXCaptchaButton.m
//  HXKit-ObjectiveC
//
//  Created by ShiCang on 14/12/31.
//  Copyright © 2016年 Cave. All rights reserved.
//

#import "HXCaptchaButton.h"

typedef BOOL(^StartBlock)(HXCaptchaButton *);
typedef void(^EndBlock)(HXCaptchaButton *);

static NSTimeInterval TimeOutFlag = 1;
static NSTimeInterval TimeDuration = 60.0f;

static NSString *TextPrompt = @"获取验证码";

@implementation HXCaptchaButton {
    NSTimeInterval _timeOut;
    NSTimer *_countDownTimer;
    
    StartBlock _startBlock;
    EndBlock _endBlock;
}

#pragma mark - Init Methods
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfigure];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initConfigure];
    }
    return self;
}

#pragma mark - Config Methods
- (void)initConfigure {
    _duration = TimeDuration;
}

#pragma mark - Parent Methods
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    [self startCountDown];
}

#pragma mark - Private Methods
- (void)startCountDown {
    if (self.enabled) {
        if (_startBlock) {
            if (_startBlock(self)) {
                _timeOut = _duration;
                [self setTitle:[NSString stringWithFormat:@"%@s", @(_timeOut)] forState:UIControlStateNormal];
                _countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
                self.enabled = NO;
            }
        }
    }
}

- (void)timeFireMethod {
    _timeOut--;
    [self setTitle:[NSString stringWithFormat:@"%@s", @(_timeOut)] forState:UIControlStateNormal];
    
    if(_timeOut < TimeOutFlag){
        [self stop];
    }
}

#pragma mark - Public Methods
- (void)timingWithDuration:(NSTimeInterval)duration start:(BOOL(^)(HXCaptchaButton *))start end:(void(^)(HXCaptchaButton *))end {
    
    _duration = duration;
    [self timing:start end:end];
}
- (void)timing:(BOOL (^)(HXCaptchaButton *))start end:(void (^)(HXCaptchaButton *))end {
    
    _startBlock = start;
    _endBlock = end;
}

- (void)stop {
    self.enabled = YES;
    [_countDownTimer invalidate];
    
    [self setTitle:TextPrompt forState:UIControlStateNormal];
    
    if (_endBlock) {
        _endBlock(self);
    }
}

#pragma mark - Delloc Methods
- (void)dealloc {
    // 如果View被移除，定时器需要废除掉
    [_countDownTimer invalidate];
}

@end
