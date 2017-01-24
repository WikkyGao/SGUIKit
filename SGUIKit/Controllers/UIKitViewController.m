//
//  UIKitViewController.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "UIKitViewController.h"

#import "SGUIButtonListVC.h"
#import "SGUITextfiedListVC.h"
#import "SGUIAlertListVC.h"
#import "ButtonListCell.h"

#import "UITestVC.h"

@interface UIKitViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataSourceArray;
    NSArray *iconArray;
}
@property(nonatomic,strong)UITableView *table;
@end

@implementation UIKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
}


- (void)initViews{
    [super initViews];
    self.table = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.table];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.backgroundColor = [UIColor groupTableViewBackgroundColor];
    dataSourceArray =@[
                       @{
                           @"title":@"SGUIButton系列",
                           @"icon":@"\uE62F",
                           },
                       @{
                           @"title":@"SGUITextfied系列",
                           @"icon":@"\uE632",
                           },
                       @{
                           @"title":@"SGUIAlert系列",
                           @"icon":@"\uE602",
                           },
                       @{
                           @"title":@"UI测试",
                           @"icon":@"\uE602",
                           },
                      ];
    
    self.table.tableFooterView = [[UIView alloc]init];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSourceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return YMAKE(80);
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    ButtonListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ButtonListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    cell.icon.text = [dataSourceArray [indexPath.row] valueForKey:@"icon"];
    cell.title.text = [dataSourceArray [indexPath.row] valueForKey:@"title"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            SGUIButtonListVC *button = [SGUIButtonListVC new];
            button.hidesBottomBarWhenPushed = YES;
            button.title = @"SGUIButton";
            [self.navigationController pushViewController:button animated:YES];
        }
            break;
        case 1:
        {
            SGUITextfiedListVC *textfield = [SGUITextfiedListVC new];
            textfield.hidesBottomBarWhenPushed = YES;
            textfield.title = @"SGUITextfied";
            [self.navigationController pushViewController:textfield animated:YES];

            
        }
            break;
        case 2:
        {
            SGUIAlertListVC *alert = [SGUIAlertListVC new];
            alert.hidesBottomBarWhenPushed = YES;
            alert.title = @"SGUIAlertView";
            [self.navigationController pushViewController:alert animated:YES];
            
        }
        case 3:
        {
            UITestVC *test = [UITestVC new];
            test.hidesBottomBarWhenPushed = YES;
            test.title = @"SGUIAlertView";
            [self.navigationController pushViewController:test animated:YES];
            
        }
            break;
            
        default:
            break;
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
