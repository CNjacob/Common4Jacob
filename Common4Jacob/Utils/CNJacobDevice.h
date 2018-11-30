//
//  CNJacobDevice.h
//  Common4Jacob
//
//  Created by jacob on 2018/11/15.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CNJacobDevice : NSObject

/**
获取屏幕分辨率
*/
+ (CGSize)deviceSize;

/**
 是否为iPad
 */
+ (BOOL)isPad;

/**
 是否为iPhone4、iPhone4S
 */
+ (BOOL)isIphone4;

/**
 是否为iPhone5、iPhone5S、iPhone5C、iPhone5SE
 */
+ (BOOL)isIphone5;

/**
 是否为iPhone6、iPhone6s、iPhone7、iPhone8
 */
+ (BOOL)isIphone6Later;

/**
 是否为iPhone6 Plus、iPhone6S Plus、iPhone7 Plus、iPhone8 Puls
 */
+ (BOOL)isIphonePlus;

/**
 是否为iPhoneX、iPhoneXS
 */
+ (BOOL)isIphoneXLater;

/**
 是否为iPhoneXR
 */
+ (BOOL)isIphoneXR;

/**
 是否为iPhoneXS Max
 */
+ (BOOL)isIphoneMax;

/**
 是否为全面屏
 */
+ (BOOL)isAllScreen;

/**
 获取全屏手机home高度
 */
+ (CGFloat)allScreenHomeHeight;

/**
 获取statusBar高度
 */
+ (CGFloat)statusBarHeight;

/**
 获取UINavigationController的navigationBar高度
 */
+ (CGFloat)navBarHeight;

/**
 获取UITabBarController的tabBar高度
 */
+ (CGFloat)tabBarHeight;

@end

NS_ASSUME_NONNULL_END
