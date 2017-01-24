//
//  BaseViewController.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)removeNavigationbarButtomLine{
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        NSArray *list=self.navigationController.navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView=(UIImageView *)obj;
                NSArray *list2=imageView.subviews;
                for (id obj2 in list2) {
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        UIImageView *imageView2=(UIImageView *)obj2;
                        imageView2.hidden=YES;
                    }
                }
            }
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self removeNavigationbarButtomLine];
    [self initViews];
    NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:YMAKE(20)],NSFontAttributeName, nil];
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    self.navigationController.navigationBar.barTintColor = K_default_color;
    
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    //判断viewcontroller是否push过来
    if (viewcontrollers.count > 1) {
        NSDictionary *attributes1=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"iconfont" size:YMAKE(18)],NSFontAttributeName, nil];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:ICONFONT_fanhui style:UIBarButtonItemStyleDone target:self action:@selector(popVC)];
        [backItem setTitleTextAttributes:attributes1 forState:UIControlStateNormal];
        self.navigationItem.leftBarButtonItem = backItem;
        self.navigationController.interactivePopGestureRecognizer.delegate = (id) self;
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)popVC{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)initViews{
    
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
