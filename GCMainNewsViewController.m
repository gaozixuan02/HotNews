//
//  GCMainNewsViewController.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCMainNewsViewController.h"
#import "Macro.h"
#import "AFNetworking.h"
#import "GCVideo.h"
#import "MJRefresh.h"
#import "DVideoCell.h"
#import "DVideoPlayer.h"
#import "DVideoItem.h"
#import "NSObject+MJKeyValue.h"
@interface GCMainNewsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{
    NSIndexPath *_indexPath;
    DVideoPlayer *_player;
    CGRect _currentPlayCellRect;
}
@property (nonatomic, strong) NSMutableArray *videoArray;
@property (strong, nonatomic) UITableView *videoPlayerTableView;
@property(nonatomic,assign)int number;

@end

@implementation GCMainNewsViewController
- (DVideoPlayer *)player {
    if (!_player) {
        _player = [[DVideoPlayer alloc] init];
        _player.frame = CGRectMake(0, 64, WIDTH, 250);
    }
    return _player;
}

- (NSMutableArray *)videoArray {
    if (!_videoArray) {
        _videoArray = [NSMutableArray array];
    }
    return _videoArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"视频";
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.videoPlayerTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.videoPlayerTableView];
    [self.videoPlayerTableView registerNib:[UINib nibWithNibName:@"DVideoCell" bundle:nil] forCellReuseIdentifier:@"XLVideoCell"];
    self.videoPlayerTableView.estimatedRowHeight = 100;
    self.videoPlayerTableView.delegate=self;
    self.videoPlayerTableView.dataSource=self;
    self.number=1;
    [self requstData:videoListUrl(self.number)];
}
-(void)requstData:(NSString*)url{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            //
            NSLog(@"正在获取");
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //
            NSArray *dataArray = responseObject[@"V9LG4B3A0"];
            for (NSDictionary *dict in dataArray) {
                [self.videoArray addObject:[DVideoItem mj_objectWithKeyValues:dict]];
            }
            [self.videoPlayerTableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //
            NSLog(@"获取失败");
        }];
        
    });


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.videoArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DVideoCell *cell = [DVideoCell videoCellWithTableView:tableView];
    DVideoItem *item = self.videoArray[indexPath.row];
    cell.videoItem = item;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showVideoPlayer:)];
    [cell.videoImageView addGestureRecognizer:tap];
    cell.videoImageView.tag = indexPath.row + 100;

    return cell;
}
- (void)showVideoPlayer:(UITapGestureRecognizer *)tapGesture {
    [_player destroyPlayer];
    _player = nil;
    
    UIView *view = tapGesture.view;
    DVideoItem *item = self.videoArray[view.tag - 100];
    
    _indexPath = [NSIndexPath indexPathForRow:view.tag - 100 inSection:0];
    DVideoCell *cell = [self.videoPlayerTableView cellForRowAtIndexPath:_indexPath];
    
    _player = [[DVideoPlayer alloc] init];
    _player.videoUrl = item.mp4_url;
    [_player playerBindTableView:self.videoPlayerTableView currentIndexPath:_indexPath];
    _player.frame = view.bounds;
    
    [cell.contentView addSubview:_player];
    
    _player.completedPlayingBlock = ^(DVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
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
