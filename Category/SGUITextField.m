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
//        self.textInsets = TextFieldTextInsets;
        self.shouldResponseToProgrammaticallyTextChanges = YES;
        self.maximumTextLength = ULONG_MAX;

    }
    return self;
}

-(void)test{
    
}

-(void)dealloc{
    self.delegate = nil;
    self.originalDelegate = nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
