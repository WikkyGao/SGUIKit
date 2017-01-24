//
//  UITestVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/22.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "UITestVC.h"

@interface UITestVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property(nonatomic,strong)UITableView *table;
@end

@implementation UITestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sourceArray = [NSMutableArray arrayWithArray: @[@"111",@"222",@"333",@"444",@"555",@"666",@"777"]];
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, K_mainWidth, K_mainHeight)];
    self.table.delegate =self;
    self.table.dataSource = self;
    self.table.editing  = YES;
    self.table.allowsMultipleSelectionDuringEditing = YES;
    [self.view addSubview:self.table];
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
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
