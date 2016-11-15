//
//  NSObject+HXSwizzling.h
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface NSObject (HXSwizzling)


+ (BOOL)hx_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel;
+ (BOOL)hx_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel;


@end
