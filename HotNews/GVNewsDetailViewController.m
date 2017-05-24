//
//  GVNewsDetailViewController.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GVNewsDetailViewController.h"

@interface GVNewsDetailViewController ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation GVNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新闻";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItem = item;
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
  
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.activityIndicatorView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.activityIndicatorView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.activityIndicatorView setColor:[UIColor redColor]];
    [self.webView addSubview:self.activityIndicatorView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    [self.webView setScalesPageToFit:YES];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}
-(void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)webViewDidStartLoad:(UIWebView *)webView{

   
    [self.activityIndicatorView startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{

   [self.activityIndicatorView stopAnimating];
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
