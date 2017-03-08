//
//  SGUITextField.m
//  SGUIKit
//
//  Created by Wikky on 2017/2/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUITextField.h"


@interface SGUITextField()<SGUITextFieldDelegate>
{
    
}
@property (nonatomic,weak)id<SGUITextFieldDelegate>originalDelegate;

@end

@implementation SGUITextField

@dynamic delegate;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
//        self.tintColor = TextFieldTintColor;
        self.placeholderColor = K_default_color;
        self.textInsets = UIEdgeInsetsMake(0, 7, 0, 7);
        self.shouldResponseToProgrammaticallyTextChanges = YES;
        self.maximumTextLength = ULONG_MAX;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
    }
    return self;
}

-(void)dealloc{
    self.delegate = nil;
    self.originalDelegate = nil;
}
#pragma mark -Placeholder
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    if (self.placeholder) {
        [self setAttributedIfNeeded];
    }
}

- (void)setPlaceholder:(NSString *)placeholder{
    [super setPlaceholder:placeholder];
    if (self.placeholderColor) {
        [self setAttributedIfNeeded];
    }
}

#pragma mark - TextInsets
-(void)setText:(NSString *)text{
    NSString *textBeforeChange = self.text;
    [super setText:text];
    if (self.shouldResponseToProgrammaticallyTextChanges &&![textBeforeChange isEqualToString:text]) {
        
    }
}
//设置placeholder颜色
- (void)setAttributedIfNeeded{
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName:self.placeholderColor}];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
