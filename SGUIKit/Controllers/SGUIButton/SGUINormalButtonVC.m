//
//  SGUINormalButtonVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/11.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUINormalButtonVC.h"
#import "SGUIButton.h"
@interface SGUINormalButtonVC ()
{
    SGUIButton *normalBtn;
    SGUIButton *iconLeftBtn;
    SGUIButton *ghostBtn;
    SGUIButton *ghostWithIconBtn;
    CGFloat buttonWidth;

}
@end

@implementation SGUINormalButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *titleText =  @"点击随机换颜色";
    buttonWidth = XMAKE(220);
    
    normalBtn = [[SGUIButton alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, 80, buttonWidth, YMAKE(45))];
    [normalBtn setTitle:titleText forState:UIControlStateNormal];
    [normalBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:normalBtn];
    
    
    
    iconLeftBtn = [[SGUIButton alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(normalBtn.frame) + YMAKE(50), buttonWidth, YMAKE(45)) type:SGUIButtonTypeFillWithIconLeft];
    [iconLeftBtn setTitle:titleText forState:UIControlStateNormal icon:@"\uE600"];
    [iconLeftBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
//    iconLeftBtn.enabled = NO;
    [self.view addSubview:iconLeftBtn];
    
    ghostBtn = [[SGUIButton alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(iconLeftBtn.frame) + YMAKE(50), buttonWidth, YMAKE(45)) type:SGUIButtonTypeGhost];
    [ghostBtn setTitle:titleText forState:UIControlStateNormal];
    [ghostBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ghostBtn];

    
    ghostWithIconBtn = [[SGUIButton alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(ghostBtn.frame) + YMAKE(50), buttonWidth, YMAKE(45)) type:SGUIButtonTypeGhost];
    ghostWithIconBtn.type = SGUIButtonTypeWithGhostIconLeft;
    [ghostWithIconBtn setTitle:titleText forState:UIControlStateNormal icon:@"\uE600"];
    [ghostWithIconBtn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ghostWithIconBtn];

    
    
    [self initDefaultViews];
    

    SGUIButton *disableBtn = [[SGUIButton alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, K_mainHeight - YMAKE(110), buttonWidth, YMAKE(45)) type:SGUIButtonTypeFill];
    disableBtn.type = SGUIButtonTypeFill;
    [disableBtn setTitle:@"不可用状态" forState:UIControlStateNormal ];
    disableBtn.enabled = NO;
    [self.view addSubview:disableBtn];

    [self changeColor:ghostBtn];
    [self changeColor:iconLeftBtn];
    [self changeColor:ghostWithIconBtn];
    [self changeColor:normalBtn];
    [self changeColor:disableBtn];
    // Do any additional setup after loading the view.
    
}

- (void)initDefaultViews{
    UILabel *normalDescription = [[UILabel alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(normalBtn.frame)+ YMAKE(8), buttonWidth, YMAKE(14))];
    normalDescription.text = @"普通按钮";
    normalDescription.textAlignment = NSTextAlignmentCenter;
    normalDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:normalDescription];
    
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(normalDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line1.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line1];
    
    
    
    UILabel *iconLeftDescription = [[UILabel alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(iconLeftBtn.frame)+ YMAKE(10), buttonWidth, YMAKE(14))];
    iconLeftDescription.text = @"左侧带iconfont图标按钮";
    iconLeftDescription.textAlignment = NSTextAlignmentCenter;
    iconLeftDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:iconLeftDescription];
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(iconLeftDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line2.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line2];
    
    UILabel *ghostDescription = [[UILabel alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(ghostBtn.frame)+ YMAKE(10), buttonWidth, YMAKE(14))];
    ghostDescription.text = @"幽灵按钮";
    ghostDescription.textAlignment = NSTextAlignmentCenter;
    ghostDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:ghostDescription];
    
    UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(ghostDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line3.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line3];
    
    UILabel *ghostWithIconDescription = [[UILabel alloc]initWithFrame:CGRectMake(0 , CGRectGetMaxY(ghostWithIconBtn.frame)+ YMAKE(10), K_mainWidth, YMAKE(14))];
    ghostWithIconDescription.text = @"幽灵按钮左侧带iconfont图标";
    ghostWithIconDescription.textAlignment = NSTextAlignmentCenter;
    ghostWithIconDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:ghostWithIconDescription];


}

- (void)changeColor : (SGUIButton*)button {
    UIColor *color0 = [UIColor colorWithR:0
                                        G:80
                                        B:152
                                        A:1];
    UIColor *color1 = [UIColor colorWithR:1
                                        G:121
                                        B:95
                                        A:1];
    UIColor *color2 = [UIColor colorWithR:235
                                        G:182
                                        B:0
                                        A:1];
    UIColor *color3 = [UIColor colorWithR:239
                                        G:63
                                        B:25
                                        A:1];
    UIColor *color4 = K_default_color;
    int y = (arc4random() % 5);

    NSArray *colorArray = @[color0,color1,color2,color3,color4];
    [button setMainColor:colorArray[y]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
