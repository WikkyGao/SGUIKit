//
//  SGUITextField.h
//  SGUIKit
//
//  Created by Wikky on 2017/2/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SGUITextFieldDelegate <UITextFieldDelegate>

-(void)test;

@end

@interface SGUITextField : UITextField


@property(nonatomic,weak) id<SGUITextFieldDelegate>delegate;
/**
 *  修改 placeholder 的颜色，默认是 UIColorPlaceholder。
 */
@property(nonatomic, strong) UIColor *placeholderColor;
/**
 *  显示允许输入的最大文字长度，默认为 NSUIntegerMax，也即不限制长度。
 */

@property(nonatomic, assign) NSUInteger maximumTextLength;
/**
 *  在使用 maximumTextLength 功能的时候，是否应该把文字长度按照 [NSString (QMUI) qmui_lengthWhenCountingNonASCIICharacterAsTwo] 的方法来计算。
 *  默认为 NO。
 */
@property(nonatomic, assign) BOOL shouldCountingNonASCIICharacterAsTwo;

/**
 *  当通过 `setText:`、`setAttributedText:`等方式修改文字时，是否应该自动触发 UIControlEventEditingChanged 事件及 UITextFieldTextDidChangeNotification 通知。
 *
 *  默认为YES（注意系统的 UITextField 对这种行为默认是 NO）
 */
@property(nonatomic, assign) BOOL shouldResponseToProgrammaticallyTextChanges;

@end
