//
//  GCSliderNewsViewController.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCSliderNewsViewController.h"
#import "Macro.h"
#import "GCNetManager.h"
#import "AFNetworking.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "GVNewsDetailViewController.h"
#import "MJRefresh.h"
@interface GCSliderNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *newsArray;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,assign)int currentPage;
@end

@implementation GCSliderNewsViewController
-(NSMutableArray *)newsArray{

    if (_newsArray==nil) {
        _newsArray = [NSMutableArray new];
    }
    return _newsArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 10;

    [self createDetail:10];
    [self setupTableView];
  }
-(void)createDetail:(int)index
{

    if ([self.title  isEqualToString:@"国内新闻"]) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:GUONEIURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
  
        });
       
    }else if ([self.title isEqualToString:@"国际新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:WORLDURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"娱乐花边"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:HUABIANURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"美女图片"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:MEINV,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"科技新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:KEJI,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"奇闻轶事"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:QIWEN,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"健康咨询"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:JIANKANG,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"旅游热点"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:LVYOU,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"体育新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:TIYURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"NBA新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:NBAURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"足球新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:FOOTBALLURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"虚拟现实"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:VR,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"IT资讯"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:ITZIXUN,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"移动互联"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:YIDONG,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"苹果新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:PINGGUO ,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"创业新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:CHUANGYE,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"军事新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:JUNSHI,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }else if ([self.title isEqualToString:@"社会新闻"]){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            NSString *url = [NSString stringWithFormat:SOCIALURL,index];
            
            [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
                //
                NSLog(@"正在获取");
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //
                id list = responseObject[@"newslist"];
                ;
                for (NSDictionary *dic in list) {
                    NewsModel *model = [NewsModel newsWithDic:dic];
                    
                    [self.newsArray addObject:model];
                    
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                    [self.tableView headerEndRefreshing];
                    [self.tableView footerEndRefreshing];
                });
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //
                NSLog(@"获取失败");
            }];
            
        });

    }
}
-(void)setupTableView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    __block int index = _currentPage;
    __weak GCSliderNewsViewController *_weakSelf = self;
    [self.tableView addHeaderWithCallback:^{
        [_weakSelf createDetail:index];
    }];
    [self.tableView addFooterWithCallback:^{
        index +=10;
        [_weakSelf createDetail:index];
    }];
    [self.view addSubview:self.tableView];


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



    return self.newsArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (cell==nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
        
    }
    NewsModel *model = self.newsArray[indexPath.row];
    cell.model = self.newsArray[indexPath.row];
    [cell.newsImage setImageWithURL:[NSURL URLWithString:model.picUrl]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     GVNewsDetailViewController *detail = [GVNewsDetailViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:detail];
    NewsModel *model = self.newsArray[indexPath.row];
    detail.url = model.url;
    [self presentViewController:nav animated:YES completion:nil];
   
    NSLog(@"%@",self.navigationItem.title);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
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
