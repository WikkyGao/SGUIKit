//
//  BaseListVC.h
//  SGUIKit
//
//  Created by Wikky on 2017/1/12.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseListVC : BaseViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray *dataSourceArray;

@property(nonatomic,strong)UITableView *table;


@end
