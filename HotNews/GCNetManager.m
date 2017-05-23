//
//  GCNetManager.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "GCNetManager.h"
#import "AFNetworking.h"
@implementation GCNetManager
static  GCNetManager *defaultManager = nil;
+(GCNetManager *)defaultManager{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (defaultManager == nil) {
            defaultManager = [[self alloc] init];
        }
    });
    return defaultManager;
}
+(instancetype)alloc{
    if (defaultManager == nil) {
        defaultManager = [super alloc];
    }
    return defaultManager;
}
-(id)getDataWithUrl:(NSString *)url{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.tianapi.com/guonei/?key=a8da6d178f86f9204b097ca7c3071a66&num=10" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
       id list = responseObject[@"newslist"];
        _data = list;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
    }];
    return  _data;
    
    }
@end
