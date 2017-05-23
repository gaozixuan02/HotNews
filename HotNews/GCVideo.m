//
//  GCVideo.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCVideo.h"

@implementation GCVideo
+(instancetype)videoWithDic:(NSDictionary *)dic{
    GCVideo *model = [GCVideo new];
    model.cover = dic[@"cover"];
    model.mp4_url = dic[@"mp4_url"];
    model.title = dic[@"title"];
    
    return model;
}
@end
