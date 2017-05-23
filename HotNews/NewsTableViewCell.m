//
//  NewsTableViewCell.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation NewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(NewsModel *)model{
    _model = model;
    [self.newsImage setImageWithURL:[NSURL URLWithString:_model.picUrl]];
    self.title.text = _model.title;
    self.ddescriptipn.text = _model.ddescription;
    self.ctime.text = _model.ctime;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
