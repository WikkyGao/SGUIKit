//
//  UITestVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/22.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "UITestVC.h"
#import "SGUITextField.h"
@interface UITestVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property(nonatomic,strong)UITableView *table;
@end

@implementation UITestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViews];
//    [self.view addSubview:self.table];
    // Do any additional setup after loading the view.
}

- (void)initViews{
    SGUITextField *sg_tf = [[SGUITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
    sg_tf.backgroundColor = [UIColor groupTableViewBackgroundColor];
    sg_tf.layer.borderColor = [UIColor darkGrayColor].CGColor;
    sg_tf.layer.borderWidth = 1;
//    sg_tf.placeholderColor = [UIColor yellowColor];
    sg_tf.font = [UIFont systemFontOfSize:24];
    sg_tf.placeholder = @"随便输入些什么试试";
    sg_tf.layer.masksToBounds = YES;
    sg_tf.center = self.view.center;
    [self.view addSubview:sg_tf];
}
#pragma mark tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourceArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.sourceArray[indexPath.row];
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}


#pragma mark Lazyload
-(UITableView *)table{
    if (!_table) {
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_mainWidth, K_mainHeight)];
        _table.delegate =self;
        _table.dataSource = self;
        _table.editing  = YES;
        _table.allowsMultipleSelectionDuringEditing = YES;

    }
    return _table;
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
