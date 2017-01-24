//
//  SGUIClearButtonVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/12.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUIClearButtonVC.h"

@interface SGUIClearButtonVC ()
{
    CGFloat buttonWidth;
}
@end

@implementation SGUIClearButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDefaultViews];
    // Do any additional setup after loading the view.
}

- (void)initDefaultViews{
//    UILabel *normalDescription = [[UILabel alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(normalBtn.frame)+ YMAKE(8), buttonWidth, YMAKE(14))];
    UILabel *normalDescription = [[UILabel alloc]init];
    normalDescription.text = @"普通按钮";
    normalDescription.textAlignment = NSTextAlignmentCenter;
    normalDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:normalDescription];
    
    UILabel *line1 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(normalDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line1.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line1];
    
    
    
//    UILabel *iconLeftDescription = [[UILabel alloc]initWithFrame:CGRectMake((K_mainWidth - buttonWidth)/2, CGRectGetMaxY(iconLeftBtn.frame)+ YMAKE(10), buttonWidth, YMAKE(14))];
    UILabel *iconLeftDescription = [[UILabel alloc]init];
    iconLeftDescription.text = @"左侧带iconfont图标按钮";
    iconLeftDescription.textAlignment = NSTextAlignmentCenter;
    iconLeftDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:iconLeftDescription];
    
    UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(iconLeftDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line2.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line2];
    
    UILabel *ghostDescription = [[UILabel alloc]init];
    ghostDescription.text = @"幽灵按钮";
    ghostDescription.textAlignment = NSTextAlignmentCenter;
    ghostDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:ghostDescription];
    
    UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(16, CGRectGetMaxY(ghostDescription.frame) + YMAKE(8), K_mainWidth - 32, 1)];
    line3.backgroundColor = [UIColor colorWithR:222 G:222 B:222 A:1];
    [self.view addSubview:line3];
    
    UILabel *ghostWithIconDescription = [[UILabel alloc]init];
    ghostWithIconDescription.text = @"幽灵按钮左侧带iconfont图标";
    ghostWithIconDescription.textAlignment = NSTextAlignmentCenter;
    ghostWithIconDescription.textColor = [UIColor darkGrayColor];
    [self.view addSubview:ghostWithIconDescription];
    
    
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
