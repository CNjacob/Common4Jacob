//
//  CNJacobDevice.m
//  Common4Jacob
//
//  Created by jacob on 2018/11/15.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "CNJacobDevice.h"

@implementation CNJacobDevice

/**
 获取屏幕分辨率
 */
+ (CGSize)deviceSize {
    return [[UIScreen mainScreen] currentMode].size;
}

/**
 是否为iPad
 */
+ (BOOL)isPad {
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

/**
 是否为iPhone4、iPhone4S
 */
+ (BOOL)isIphone4 {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(640, 960), [self deviceSize]);
}

/**
 是否为iPhone5、iPhone5S、iPhone5C、iPhone5SE
 */
+ (BOOL)isIphone5 {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(640, 1136), [self deviceSize]);
}

/**
 是否为iPhone6、iPhone6s、iPhone7、iPhone8
 */
+ (BOOL)isIphone6Later {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(750, 1334), [self deviceSize]);
}

/**
 是否为iPhone6 Plus、iPhone6S Plus、iPhone7 Plus、iPhone8 Puls
 */
+ (BOOL)isIphonePlus {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(1242, 2208), [self deviceSize]);
}

/**
 是否为iPhoneX、iPhoneXS
 */
+ (BOOL)isIphoneXLater {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(1125, 2436), [self deviceSize]);
}

/**
 是否为iPhoneXR
 */
+ (BOOL)isIphoneXR {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(828, 1792), [self deviceSize]);
}

/**
 是否为iPhoneXS Max
 */
+ (BOOL)isIphoneMax {
    if ([self isPad] || ![UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        return NO;
    }
    return CGSizeEqualToSize(CGSizeMake(1242, 2688), [self deviceSize]);
}

/**
 是否为全面屏
 */
+ (BOOL)isAllScreen {
    return [self isIphoneXLater] || [self isIphoneXR] || [self isIphoneMax];
}

/**
 获取全屏手机home高度
 */
+ (CGFloat)allScreenHomeHeight {
    return 34.f;
}

/**
 获取statusBar高度
 */
+ (CGFloat)statusBarHeight {
    return [self isAllScreen] ? 44.f : 20.f;
}

/**
 获取UINavigationController的navigationBar高度
 */
+ (CGFloat)navBarHeight {
    return [self isAllScreen] ? 88.f : 64.f;
}

/**
 获取UITabBarController的tabBar高度
 */
+ (CGFloat)tabBarHeight {
    return [self isAllScreen] ? 83.f : 49.f;
}

@end
