//
//  NSObject+HXSwizzling.m
//  HXKit-ObjectiveC
//
//  Created by RockerHX.
//  Copyright © Caver. All rights reserved.
//


#import "NSObject+HXSwizzling.h"
#import <objc/runtime.h>


@implementation NSObject (HXSwizzling)


+ (BOOL)hx_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
    Method origMethod = class_getInstanceMethod(self, origSel);
    Method altMethod = class_getInstanceMethod(self, altSel);
    
    if (!origMethod || !altMethod) {
        return NO;
    }
    
    class_addMethod(self,
                    origSel,
                    class_getMethodImplementation(self, origSel),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel,
                    class_getMethodImplementation(self, altSel),
                    method_getTypeEncoding(altMethod));
    method_exchangeImplementations(class_getInstanceMethod(self, origSel),
                                   class_getInstanceMethod(self, altSel));
    return YES;
}

+ (BOOL)hx_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel {
    return [object_getClass(self) hx_swizzleMethod:origSel withMethod:altSel];
}


@end
