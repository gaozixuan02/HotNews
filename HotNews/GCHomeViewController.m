//
//  GCHomeViewController.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCHomeViewController.h"
#import "GCSliderNewsViewController.h"
@interface GCHomeViewController ()

@end

@implementation GCHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.titleArray = [NSMutableArray arrayWithArray:@[@"国内新闻",@"国际新闻",@"社会新闻",@"娱乐花边",@"美女图片",@"科技新闻",@"奇闻轶事",@"健康咨询",@"旅游热点",@"体育新闻",@"NBA新闻",@"足球新闻",@"虚拟现实",@"IT资讯",@"移动互联",@"苹果新闻",@"创业新闻",@"军事新闻",]];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSString *titleStirng in self.titleArray) {
        GCSliderNewsViewController *vc = [[GCSliderNewsViewController alloc] init];
        vc.title = titleStirng;
        [array addObject:vc];
    }
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.controllerArray = array;
}
#pragma mark - 父类方法、切换tab
- (void)scrollViewSelectToIndex:(UIButton *)button
{
    [super scrollViewSelectToIndex:button];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [super scrollViewDidScroll:scrollView];
}
- (void)selectButton:(NSInteger)index
{
    [super selectButton:index];
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
