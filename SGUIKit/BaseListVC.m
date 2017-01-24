//
//  BaseListVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/12.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "BaseListVC.h"

@interface BaseListVC ()<UITableViewDelegate,UITableViewDataSource>
{
//    NSArray *dataSourceArray;
}

@end

@implementation BaseListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table = [[UITableView alloc]initWithFrame:self.view.frame];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    self.table.tableFooterView = [[UIView alloc]init];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.textLabel.text = _dataSourceArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)initViews{
    [super initViews];
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
