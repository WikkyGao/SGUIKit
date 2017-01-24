//
//  SGUIButton.h
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SGUIButtonTypeFill,
    SGUIButtonTypeFillWithIconLeft,
    SGUIButtonTypeGhost,
    SGUIButtonTypeWithGhostIconLeft,
} SGUIButtonType;

typedef enum {
    QMUIButtonImagePositionTop,             // imageView在titleLabel上面
    QMUIButtonImagePositionLeft,            // imageView在titleLabel左边
    QMUIButtonImagePositionBottom,          // imageView在titleLabel下面
    QMUIButtonImagePositionRight,           // imageView在titleLabel右边
} QMUIButtonImagePosition;


@interface SGUIButton : UIButton

/**
 * 设置按钮点击时的背景色，默认为nil。
 * @warning 不支持带透明度的背景颜色。当设置<i>highlightedBackgroundColor</i>时，会强制把<i>adjustsButtonWhenHighlighted</i>设为NO，避免两者效果冲突。
 * @see adjustsButtonWhenHighlighted
 */
@property(nonatomic, strong) UIColor *highlightedBackgroundColor;

/**
 * 设置按钮点击时的边框颜色，默认为nil。
 * @warning 当设置<i>highlightedBorderColor</i>时，会强制把<i>adjustsButtonWhenHighlighted</i>设为NO，避免两者效果冲突。
 * @see adjustsButtonWhenHighlighted
 */
@property(nonatomic, strong) UIColor *highlightedBorderColor;
/**
 * 是否自动调整highlighted时的按钮样式，默认为YES。<br/>
 * 当值为YES时，按钮highlighted时会改变自身的alpha属性为<b>ButtonHighlightedAlpha</b>
 */
@property(nonatomic, assign) BOOL adjustsButtonWhenHighlighted;

/**
 * 是否自动调整disabled时的按钮样式，默认为YES。<br/>
 * 当值为YES时，按钮disabled时会改变自身的alpha属性为<b>ButtonDisabledAlpha</b>
 */
@property(nonatomic, assign) BOOL adjustsButtonWhenDisabled;


@property(nonatomic, assign)SGUIButtonType type;

/**
 设置初始化方法

 @param title 按钮标题
 @param state 按钮状态
 @param icon 按钮左侧icon
 */
-(void)setTitle:(NSString *)title forState:(UIControlState)state icon:(NSString*)icon;
- (instancetype)initWithFrame:(CGRect)frame type:(SGUIButtonType)type;

- (void)setMainColor : (UIColor*)mainColor;
@end

