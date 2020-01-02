//
//  CJResultViewController.m
//  UISearchController
//
//  Created by dd luo on 2019/12/31.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "CJResultViewController.h"

@interface CJResultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSString * resultStr;
@property(nonatomic,strong)   UITableView * tableview;

@end

@implementation CJResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView * tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableview = tableview;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}
// 输入内容发生变化,会调用此方法
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"%@",searchController.searchBar.text);
    self.resultStr = searchController.searchBar.text;
    [self.tableview reloadData];
    
}
//  MARK: - UITableViewDelegate and UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = self.resultStr;
    return cell;
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
