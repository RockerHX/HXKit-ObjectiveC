//
//  UIView+FindUIViewController.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX on 16/1/18.
//  Copyright © 2016年 Caver. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (HXFindViewController)


- (UIViewController *)firstAvailableViewController;
- (__kindof UIResponder *)traverseResponderChainForViewController;

@end
