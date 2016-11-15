//
//  UIView+HXFindViewController.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX on 16/1/18.
//  Copyright © 2016年 Caver. All rights reserved.
//


#import "UIView+HXFindViewController.h"


@implementation UIView (HXFindViewController)


- (UIViewController *)firstAvailableViewController {
    // convenience function for casting and to "mask" the recursive function
    return (UIViewController *)[self traverseResponderChainForViewController];
}

- (__kindof UIResponder *)traverseResponderChainForViewController {
    id nextResponder = [self nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        return nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]]) {
        return [nextResponder traverseResponderChainForViewController];
    } else {
        return nil;
    }
}


@end
