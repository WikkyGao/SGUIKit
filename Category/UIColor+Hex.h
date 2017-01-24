//
//  UIColor+Hex.h
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
/**
 透明度固定为1，以0x开头的十六进制转换成的颜色

 @param hexColor 以0x开头的十六进制转
 @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor;
/**
 0x开头的十六进制转换成的颜色,透明度可调整
 @param hexColor 0x开头的十六进制
 @param opacity 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

/**
 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
 @param color 以#开头的16进制字符串
 @return UIColor
 */
+ (UIColor *) colorWithHexString: (NSString *)color;


+ (UIColor *) colorWithR: (CGFloat)Red G:(CGFloat)Green B :(CGFloat)Blue A:(CGFloat)Alpha;
@end
