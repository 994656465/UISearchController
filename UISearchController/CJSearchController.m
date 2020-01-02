//
//  CJSearchController.m
//  UISearchController
//
//  Created by dd luo on 2019/12/31.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "CJSearchController.h"
#import "CJResultViewController.h"

@interface CJSearchController ()<UISearchControllerDelegate>

@end

@implementation CJSearchController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"搜索";
    self.view.backgroundColor = [UIColor purpleColor];
    [self creatSearchController];
    [self creatScrollview];
}


-(void)creatScrollview{
    NSInteger count = 3;
    CGFloat margin = 30;
    CGFloat hegiht  = 20;
    CGFloat width = (self.view.bounds.size.width - (count + 1)* margin)/count;
    for (NSInteger i = 0;  i < 9; i++) {
        UIButton * button  = [UIButton  buttonWithType:0];
        button.backgroundColor = [UIColor blueColor];
        NSInteger row = i / count;
        NSInteger col = i % count;
        [button setTitle:[NSString stringWithFormat:@"%zd",i] forState:UIControlStateNormal];
        button.frame = CGRectMake(margin * (col + 1) + width * col , 200  + (row + margin) * row, width, hegiht);
        [self.view addSubview:button];
    }
    
}
-(void)creatSearchController{
    
    CJResultViewController * resultVC = [[CJResultViewController alloc]init];
    UISearchController * searchVC = [[UISearchController alloc]initWithSearchResultsController:resultVC];
    //当输入框激活状态,整个界面会添加一个半透明的view ,默认是添加的
    searchVC.obscuresBackgroundDuringPresentation = YES;
    //  当输入框激活的状态,会隐藏导航条,默认状态是隐藏的
    searchVC.hidesNavigationBarDuringPresentation = YES;
    searchVC.searchResultsUpdater = resultVC;
    searchVC.delegate = self;
//    searchVC.searchResultsUpdater = resultVC;
    self.navigationItem.searchController = searchVC;
    // 滚动的时候是否隐藏搜索框,默认是隐藏的
    self.navigationItem.hidesSearchBarWhenScrolling = YES;

    
    
}
//UISearchControllerDelegate 测试UISearchController的执行过程

- (void)willPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"willPresentSearchController");
}

- (void)didPresentSearchController:(UISearchController *)searchController
{
    NSLog(@"didPresentSearchController");
}

- (void)willDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"willDismissSearchController");
}

- (void)didDismissSearchController:(UISearchController *)searchController
{
    NSLog(@"didDismissSearchController");
}

- (void)presentSearchController:(UISearchController *)searchController
{
    NSLog(@"presentSearchController");
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
