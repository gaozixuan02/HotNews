//
//  NewsModel.h
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property (nonatomic,strong) NSString *ctime;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *ddescription;
@property (nonatomic,strong) NSString *picUrl;
@property (nonatomic,strong) NSString *url;
+(instancetype)newsWithDic:(NSDictionary *)dic;

@end
