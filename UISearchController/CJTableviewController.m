//
//  CJTableviewController.m
//  UISearchController
//
//  Created by dd luo on 2020/1/2.
//  Copyright © 2020 dd luo. All rights reserved.
//

#import "CJTableviewController.h"
#import "CJResultViewController.h"

@interface CJTableviewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)   UITableView * tableview;

@end

@implementation CJTableviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];

    [self creatTableView];
    [self creatSearchView];

}

-(void)creatSearchView{
    CJResultViewController * resultVC = [[CJResultViewController alloc]init];
           UISearchController * searchVC = [[UISearchController alloc]initWithSearchResultsController:resultVC];
           //当输入框激活状态,整个界面会添加一个半透明的view ,默认是添加的
           searchVC.obscuresBackgroundDuringPresentation = YES;
           //  当输入框激活的状态,会隐藏导航条,默认状态是隐藏的
           searchVC.hidesNavigationBarDuringPresentation = YES;
           searchVC.searchResultsUpdater = resultVC;
//           self.navigationItem.searchController = searchVC;
    self.tableview.tableHeaderView = searchVC.searchBar;
           // 滚动的时候是否隐藏搜索框,默认是隐藏的
           self.navigationItem.hidesSearchBarWhenScrolling = NO;

}


-(void)creatTableView{
    
    UITableView * tableview = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableview = tableview;
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
}

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
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
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
