//
//  ViewController.m
//  UISearchController
//
//  Created by dd luo on 2019/12/31.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "ViewController.h"
#import "CJSearchController.h"
#import "CJTableviewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton * button = [UIButton buttonWithType:0];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    UIButton * greenbutton = [UIButton buttonWithType:0];
    greenbutton.frame = CGRectMake(100, 400, 100, 100);
    [greenbutton addTarget:self action:@selector(greenbuttonClick) forControlEvents:UIControlEventTouchUpInside];
    greenbutton.backgroundColor = [UIColor greenColor];
    [self.view addSubview:greenbutton];
    
    
}

-(void)buttonClick{
    CJSearchController * searchVC  = [[CJSearchController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}
-(void)greenbuttonClick{
    CJTableviewController * searchVC  = [[CJTableviewController alloc]init];
    [self.navigationController pushViewController:searchVC animated:YES];
    
}



@end
