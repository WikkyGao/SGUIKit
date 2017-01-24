//
//  SGUITextfiedListVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/12.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUITextfiedListVC.h"

@interface SGUITextfiedListVC ()
@end

@implementation SGUITextfiedListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArray =@[@"普通Textfied",@"圆角边框Textfied"];
    
    // Do any additional setup after loading the view.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了第%ld个",indexPath.row + 1);
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
