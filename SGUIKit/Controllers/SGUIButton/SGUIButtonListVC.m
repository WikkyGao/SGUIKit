//
//  SGUIButtonListVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/11.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "SGUIButtonListVC.h"

#import "SGUINormalButtonVC.h"
#import "SGUIClearButtonVC.h"
@interface SGUIButtonListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *dataSourceArray;
}
@property(nonatomic,strong)UITableView *table;

@end

@implementation SGUIButtonListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    dataSourceArray = @[@"SGUIButton",@"SGUIClearButton"];
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
    return dataSourceArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    cell.textLabel.text = dataSourceArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseViewController *vc = [BaseViewController new];

    switch (indexPath.row) {
        case 0:
        {
            SGUINormalButtonVC *vv = [SGUINormalButtonVC new];
            vc = vv;
        }
            break;
        case 1:
        {
            SGUIClearButtonVC *vv = [SGUIClearButtonVC new];
            vc = vv;
        }
            break;
        default:
            break;
    }
    vc.title = dataSourceArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

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
