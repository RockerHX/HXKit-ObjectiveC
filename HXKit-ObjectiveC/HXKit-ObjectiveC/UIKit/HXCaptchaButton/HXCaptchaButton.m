//
//  HXCaptchaButton.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import "HXCaptchaButton.h"


typedef BOOL(^StartBlock)(HXCaptchaButton *);
typedef void(^EndBlock)(HXCaptchaButton *);

static NSTimeInterval HXCBTimeOutFlag = 0;
static NSTimeInterval HXCBTimeDuration = 60.0f;

static NSString *TextPrompt = @"获取验证码";


@implementation HXCaptchaButton {
    
    NSTimeInterval _timeOut;
    NSTimer *_countDownTimer;
    
    StartBlock _startBlock;
    EndBlock _endBlock;
    
    dispatch_source_t _timer;
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
    
    _duration = HXCBTimeDuration;
    _prompt = TextPrompt;
    
    [self setButtonPrompt];
}

#pragma mark - Parent Methods
- (void)endTrackingWithTouch:(nullable UITouch *)touch withEvent:(nullable UIEvent *)event {
    
    [self startCountDown];
}

#pragma mark - Private Methods
dispatch_source_t GreateDispatchTimer(uint64_t interval,
                                      uint64_t leeway,
                                      dispatch_queue_t queue,
                                      dispatch_block_t block) {
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    if (timer) {
        dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), interval, leeway);
        dispatch_source_set_event_handler(timer, block);
        dispatch_resume(timer);
    }
    return timer;
}

- (void)startCountDown {
    
    if (self.enabled) {
        if (_startBlock) {
            if (_startBlock(self)) {
                _timeOut = _duration;
                
                _timer = GreateDispatchTimer(NSEC_PER_SEC, USEC_PER_SEC, dispatch_get_main_queue(), ^{
                    [self setTitle:[NSString stringWithFormat:@"%@s", @(_timeOut)] forState:UIControlStateNormal];
                    
                    if(_timeOut <= HXCBTimeOutFlag) {
                        [self stop];
                    }
                    _timeOut--;
                });
                
                self.enabled = NO;
            }
        }
    }
}

- (void)setButtonPrompt {
    
    if (_timer) {
        dispatch_source_cancel(_timer);
        _timer = nil;
    }
    [self setTitle:_prompt forState:UIControlStateNormal];
}

#pragma mark - Public Methods
- (void)timing:(BOOL (^)(HXCaptchaButton *))start
           end:(void (^)(HXCaptchaButton *))end {
    
    _startBlock = start;
    _endBlock = end;
}

- (void)timingWithDuration:(NSTimeInterval)duration
                     start:(BOOL(^)(HXCaptchaButton *))start
                       end:(void(^)(HXCaptchaButton *))end {
    
    _duration = duration;
    [self timing:start end:end];
}

- (void)stop {
    
    [self setButtonPrompt];
    
    if (_endBlock) {
        _endBlock(self);
    }
    self.enabled = YES;
}

#pragma mark - Delloc Methods
- (void)dealloc {
    
    [_countDownTimer invalidate];
}


@end
