//
//  SGUIButton.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUIButton.h"
@interface SGUIButton ()

@property(nonatomic, strong) CALayer *highlightedBackgroundLayer;
@property(nonatomic, strong) UIColor *originBorderColor;
@end

@implementation SGUIButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.adjustsButtonWhenHighlighted = YES;
        self.adjustsButtonWhenDisabled = YES;
        self.type = SGUIButtonTypeFill;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        [self setMainColor:K_default_color];
        self.contentEdgeInsets = UIEdgeInsetsMake(1, 0, 1, 0);
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame type:(SGUIButtonType)type{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        self.type = type;
        self.adjustsButtonWhenHighlighted = YES;
        self.adjustsButtonWhenDisabled = YES;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        [self setMainColor:K_default_color];
        self.contentEdgeInsets = UIEdgeInsetsMake(1, 0, 1, 0);
    }
    return self;
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state icon:(NSString*)icon{
    [super setTitle:title forState:state];
    if (self.type == SGUIButtonTypeFillWithIconLeft) {
        NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@",icon,title]];
        [attTitle addAttributes:@{
                                  NSFontAttributeName : [UIFont fontWithName:@"iconfont" size:YMAKE(20)],
                                  NSForegroundColorAttributeName : [UIColor whiteColor]
                                  }
                          range:NSMakeRange(0, 1)];
        [attTitle addAttributes:@{
                                  NSFontAttributeName : [UIFont systemFontOfSize:YMAKE(18)],
                                  NSForegroundColorAttributeName : [UIColor whiteColor]
                                  }
                          range:NSMakeRange(1, [attTitle.string length] -1)];
        [self setAttributedTitle:attTitle forState:UIControlStateNormal];
    }
    else if (self.type == SGUIButtonTypeWithGhostIconLeft){
        NSMutableAttributedString *attTitle = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@ %@",icon,title]];
        [attTitle addAttributes:@{
                                  NSFontAttributeName : [UIFont fontWithName:@"iconfont" size:YMAKE(20)],
                                  NSForegroundColorAttributeName : K_default_color
                                  }
                          range:NSMakeRange(0, 1)];
        [attTitle addAttributes:@{
                                  NSFontAttributeName : [UIFont systemFontOfSize:YMAKE(18)],
                                  NSForegroundColorAttributeName : K_default_color
                                  }
                          range:NSMakeRange(1, [attTitle.string length] -1)];
        [self setAttributedTitle:attTitle forState:UIControlStateNormal];

    }
}

-(void)layoutSubviews{
    [super layoutSubviews];

}
- (void)layoutSublayersOfLayer:(CALayer *)layer{
    [super layoutSublayersOfLayer:layer];

    self.layer.cornerRadius = self.frame.size.height/2;
    
}
- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor {
    _highlightedBackgroundColor = highlightedBackgroundColor;
    if (_highlightedBackgroundColor) {
        // 只要开启了highlightedBackgroundColor，就默认不需要alpha的高亮
        self.adjustsButtonWhenHighlighted = NO;
    }
}

- (void)setHighlightedBorderColor:(UIColor *)highlightedBorderColor {
    _highlightedBorderColor = highlightedBorderColor;
    if (_highlightedBorderColor) {
        // 只要开启了highlightedBorderColor，就默认不需要alpha的高亮
        self.adjustsButtonWhenHighlighted = NO;
    }
}
-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    
    if (highlighted && !self.originBorderColor) {
        // 手指按在按钮上会不断触发setHighlighted:，所以这里做了保护，设置过一次就不用再设置了
        self.originBorderColor = [UIColor colorWithCGColor:self.layer.borderColor];
    }
    
    // 渲染背景色
    if (self.highlightedBackgroundColor || self.highlightedBorderColor) {
        [self adjustsButtonHighlighted];
    }
    // 如果此时是disabled，则disabled的样式优先
    if (!self.enabled) {
        return;
    }
    // 自定义highlighted样式
    if (self.adjustsButtonWhenHighlighted) {
        if (highlighted) {
//            self.alpha = ButtonHighlightedAlpha;
            self.alpha = 0.3;
        } else {
            [UIView animateWithDuration:0.25f animations:^{
                self.alpha = 1;
            }];
        }
    }

}

- (void)adjustsButtonHighlighted {
    if (self.highlightedBackgroundColor) {
        if (!self.highlightedBackgroundLayer) {
            self.highlightedBackgroundLayer = [CALayer layer];
//            [self.highlightedBackgroundLayer qmui_removeDefaultAnimations];

            [self.highlightedBackgroundLayer removeAllAnimations];
            [self.layer insertSublayer:self.highlightedBackgroundLayer atIndex:0];
        }
        self.highlightedBackgroundLayer.frame = self.bounds;
        self.highlightedBackgroundLayer.cornerRadius = self.layer.cornerRadius;
        self.highlightedBackgroundLayer.backgroundColor = self.highlighted ? self.highlightedBackgroundColor.CGColor : [UIColor clearColor].CGColor;
    }
    
    if (self.highlightedBorderColor) {
        self.layer.borderColor = self.highlighted ? self.highlightedBorderColor.CGColor : self.originBorderColor.CGColor;
    }
}

- (void)setMainColor : (UIColor*)mainColor{
    if (self.type == SGUIButtonTypeFill || self.type == SGUIButtonTypeFillWithIconLeft) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setBackgroundColor:mainColor];
        self.layer.borderColor = self.backgroundColor.CGColor ;

    }
    else if(self.type == SGUIButtonTypeGhost ){
        [self setTitleColor:mainColor forState:UIControlStateNormal ];
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.borderColor = mainColor.CGColor ;
    }
    else if (self.type == SGUIButtonTypeWithGhostIconLeft){
        NSMutableAttributedString *attTitle = (NSMutableAttributedString*)self.currentAttributedTitle;

        [attTitle addAttributes:@{
                                  NSForegroundColorAttributeName : mainColor
                                  }
                          range:NSMakeRange(0, 1)];
        [attTitle addAttributes:@{
                                  NSForegroundColorAttributeName : mainColor
                                  }
                          range:NSMakeRange(1, [attTitle.string length] -1)];

        [self setAttributedTitle:attTitle forState:UIControlStateNormal];
        [self setTitleColor:mainColor forState:UIControlStateNormal ];
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.borderColor = mainColor.CGColor ;

    }
}
- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (!enabled && self.adjustsButtonWhenDisabled) {
        self.alpha = 0.3;
    } else {
        [UIView animateWithDuration:0.25f animations:^{
            self.alpha = 1;
        }];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
