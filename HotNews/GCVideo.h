//
//  GCVideo.h
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCVideo : NSObject
@property (nonatomic, strong) NSString *cover;

@property (nonatomic, strong) NSString *mp4_url;

@property (nonatomic, strong) NSString *title;
+(instancetype)videoWithDic:(NSDictionary *)dic;
@end
