//
//  Header.h
//  MYShow
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define K_mainWidth    [UIScreen mainScreen].bounds.size.width
#define K_mainHeight   [UIScreen mainScreen].bounds.size.height

#define K_FIRST_LANUCH      @"first_lanuch"         //第一次启动   true false



#define K_default_color [UIColor colorWithRed:250/255.0 green:34/255.0 blue:34/255.0 alpha:1]
#define K_highlight_color [UIColor colorWithHexString:@"＃3f7fd5"]



// 屏幕适配
#define XMAKE(x) (x) * [UIScreen mainScreen].bounds.size.width / 375
#define YMAKE(y) (y) * [UIScreen mainScreen].bounds.size.height / 667

#define k_textFieldHeight 48.0f


#import "UIColor+Hex.h"
//iconfont

#endif /* Header_h */
