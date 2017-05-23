//
//  NewsModel.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel
+(instancetype)newsWithDic:(NSDictionary *)dic{
    NewsModel *model = [NewsModel new];
    model.ctime = dic[@"ctime"];
    model.ddescription = dic[@"description"];
    model.title = dic[@"title"];
    model.picUrl = dic[@"picUrl"];
    model.url = dic[@"url"];
    return model;
}
@end
