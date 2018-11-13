//
//  NSObject+CNJacobRuntime.m
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "NSObject+CNJacobRuntime.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation NSObject (CNJacobRuntime)

+ (void)applicationWillResignActiveNotification:(NSNotification *)note {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

+ (void)load {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActiveNotification:) name:UIApplicationWillResignActiveNotification object:nil];
}

+ (void)getPropertyList {
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        const char *propertyName = property_getName(propertyList[i]);
        NSLog(@"propertyList = %@",[NSString stringWithUTF8String:propertyName]);
    }
}

+ (void)getMethodList {
    unsigned int count;
    Method *methodList = class_copyMethodList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"method = %@",NSStringFromSelector(method_getName(method)));
    }
}

+ (void)getIvarList {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Ivar var = ivarList[i];
        const char *varName = ivar_getName(var);
        NSLog(@"var = %@",[NSString stringWithUTF8String:varName]);
    }
    
}

+ (void)getProtocolList {
    unsigned int count;
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i++) {
        Protocol *pro = protocolList[i];
        const char *proName = protocol_getName(pro);
        NSLog(@"proName = %@",[NSString stringWithUTF8String:proName]);
    }
}

- (void)exchangeMethod:(SEL)originalSelector newMethod:(SEL)newSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(newMethod),
                                        method_getTypeEncoding(newMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end
