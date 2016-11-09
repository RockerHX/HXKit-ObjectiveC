//
//  UIView+FindUIViewController.h
//
//  Created by RockerHX on 16/1/18.
//  Copyright © 2016年 Andy Shaw. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (HXFindViewController)


- (UIViewController *)firstAvailableViewController;
- (instancetype)traverseResponderChainForViewController;

@end
