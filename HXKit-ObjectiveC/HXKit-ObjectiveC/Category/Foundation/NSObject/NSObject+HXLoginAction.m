//
//  NSObject+HXLoginAction.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import "NSObject+HXLoginAction.h"


NSString *const hx_kLoginNotification   = @"hx_kLoginNotification";
NSString *const hx_kLogoutNotification  = @"hx_kLogoutNotification";


@implementation NSObject (HXLoginAction)


- (void)shouldLogin {
    [[NSNotificationCenter defaultCenter] postNotificationName:hx_kLoginNotification object:nil];
}

- (void)shouldLogout {
    [[NSNotificationCenter defaultCenter] postNotificationName:hx_kLogoutNotification object:nil];
}


@end
