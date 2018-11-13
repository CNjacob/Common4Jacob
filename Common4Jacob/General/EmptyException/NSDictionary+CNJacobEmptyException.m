//
//  NSDictionary+CNJacobEmptyException.m
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "NSDictionary+CNJacobEmptyException.h"
#import <objc/runtime.h>

@implementation NSDictionary (CNJacobEmptyException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSPlaceholderDictionary") exchangeMethod:@selector(initWithObjects:forKeys:count:) newMethod:@selector(jacob_initWithObjects:forKeys:count:)];
            [objc_getClass("__NSPlaceholderDictionary") exchangeMethod:@selector(dictionaryWithObjects:forKeys:count:) newMethod:@selector(jacob_dictionaryWithObjects:forKeys:count:)];
        }
    });
}

#pragma mark - 创建字典
- (instancetype)jacob_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count {
    id safeObjects[count];
    id safeKeys[count];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < count; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
            NSLog(@"字典value为空 %s",__FUNCTION__);
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self jacob_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

+ (instancetype)jacob_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count {
    id safeObjects[count];
    id safeKeys[count];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < count; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
            NSLog(@"字典value为空 %s",__FUNCTION__);
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self jacob_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end


@implementation NSMutableDictionary (CNJacobEmptyException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            [objc_getClass("__NSDictionaryM") exchangeMethod:@selector(setObject:forKey:) newMethod:@selector(jacob_setObject:forKey:)];
            [objc_getClass("__NSDictionaryM") exchangeMethod:@selector(setObject:forKeyedSubscript:) newMethod:@selector(jacob_setObject:forKeyedSubscript:)];
        }
    });
}

- (void)jacob_setObject:(id)object forKey:(NSString *)key {
    if (!key) {
        NSLog(@"字典key为空 %s", __FUNCTION__);
        return;
    }
    if (!object) {
        object = [NSNull null];
        NSLog(@"字典value为空 %s", __FUNCTION__);
    }
    
    [self jacob_setObject:object forKey:key];
}

- (void)jacob_setObject:(id)object forKeyedSubscript:(id<NSCopying>)key {
    if (!key) {
        NSLog(@"字典key为空 %s", __FUNCTION__);
        return;
    }
    if (!object) {
        object = [NSNull null];
        NSLog(@"字典value为空 %s", __FUNCTION__);
    }
    
    [self jacob_setObject:object forKeyedSubscript:key];
}

@end
