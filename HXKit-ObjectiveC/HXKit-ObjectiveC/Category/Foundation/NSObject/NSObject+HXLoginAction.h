//
//  NSObject+HXLoginAction.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import <UIKit/UIKit.h>


FOUNDATION_EXPORT NSString *const hx_kLoginNotification;
FOUNDATION_EXPORT NSString *const hx_kLogoutNotification;


@interface NSObject (HXLoginAction)


- (void)shouldLogin;
- (void)shouldLogout;


@end
