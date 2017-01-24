//
//  ButtonListCell.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/18.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "ButtonListCell.h"
#import "Header.h"
@implementation ButtonListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake(XMAKE(10), YMAKE(10), K_mainWidth - XMAKE(20), YMAKE(70))];
        
        self.icon   = [[UILabel alloc]initWithFrame:CGRectMake(XMAKE(10), YMAKE(15), XMAKE(50), YMAKE(40))];
        self.title  = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame), YMAKE(20),XMAKE(180), YMAKE(30))];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 6;
    self.bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.bgView];
    
    self.icon.font = [UIFont fontWithName:@"iconfont" size:YMAKE(40)];
    self.icon.textColor = K_default_color;
    
    UILabel *forword = [[UILabel alloc]initWithFrame:CGRectMake(self.bgView.frame.size.width - XMAKE(35) , YMAKE(70 - 24)/2, XMAKE(25), YMAKE(24))];
    forword.font = [UIFont fontWithName:@"iconfont" size:YMAKE(24)];
    forword.text = @"\uE604";
    forword.textColor = [UIColor lightGrayColor];

    [self.bgView addSubview:forword];
    
    [self.bgView addSubview:self.icon];
    [self.bgView addSubview:self.title];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
