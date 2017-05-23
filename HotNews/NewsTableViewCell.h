//
//  NewsTableViewCell.h
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *ddescriptipn;
@property (weak, nonatomic) IBOutlet UILabel *ctime;
@property (nonatomic, strong) NewsModel *model;
@end
