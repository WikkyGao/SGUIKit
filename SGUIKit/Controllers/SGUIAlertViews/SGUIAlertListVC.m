//
//  SGUIAlertListVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/18.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUIAlertListVC.h"

@interface SGUIAlertListVC ()

@end

@implementation SGUIAlertListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSourceArray = @[@[@"系统ActionSheet",@"系统AlertController",@"系统AlertTextController"],@[@"12",@"34",@"56"],@[@"123",@"456",@"789",@"122"]];
    // Do any additional setup after loading the view.
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[NSArray arrayWithArray:self.dataSourceArray[indexPath.section]] objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    else{
        return 0.000001;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[NSArray arrayWithArray:self.dataSourceArray[section]] count];;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0.00001;
    }
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceArray.count;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        UIAlertController *defaultAlertController = [UIAlertController alertControllerWithTitle:@"系统自带AlertController" message:@"你真的确定要删除了吗?\n真的删了的话就什么都没有了哦😯" preferredStyle:0];
        if (indexPath.row ==1 || indexPath.row == 2){
            defaultAlertController = [UIAlertController alertControllerWithTitle:@"系统自带AlertController" message:@"你真的确定要删除了吗?\n真的删了的话就什么都没有了哦😯" preferredStyle:1];
        }

        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"我先想想" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"那就删吧" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertAction *confirm2 = [UIAlertAction actionWithTitle:@"删了还要吐槽" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        }];
        [defaultAlertController addAction:cancel];
        if (indexPath.row !=2) {
            [defaultAlertController addAction:confirm];

        }
        else if (indexPath.row == 2) {
            [defaultAlertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
              textField.placeholder = @"输入你的银行账号";
            }];
            [defaultAlertController addAction:confirm2];

        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:defaultAlertController animated:YES completion:nil];
        });
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
