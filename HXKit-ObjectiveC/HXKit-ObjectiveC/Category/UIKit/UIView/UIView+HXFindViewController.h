//
//  UIView+HXFindViewController.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface UIView (HXFindViewController)


- (UIViewController *)firstAvailableViewController;
- (__kindof UIResponder *)traverseResponderChainForViewController;


@end
