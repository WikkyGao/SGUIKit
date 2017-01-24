//
//  UIAnimationViewController.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "UIAnimationViewController.h"
#import "LoadingVC.h"
@interface UIAnimationViewController ()
{
    UIView *animationView;
}
@end

@implementation UIAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];

    // Do any additional setup after loading the view.
}
-(void)initViews{
//    animationView = [self animationView];
//    animationView.center = self.view.center;
//    [self.view addSubview:animationView];
    self.dataSourceArray = @[@"动画1",@"动画2",@"动画3"];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LoadingVC *load = [LoadingVC new];
        load.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:load animated:YES];
    }
    else if (indexPath.row == 1) {
        
    }
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
