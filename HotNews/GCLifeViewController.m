//
//  GCLifeViewController.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCLifeViewController.h"

@interface GCLifeViewController ()

@end

@implementation GCLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"生活";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
