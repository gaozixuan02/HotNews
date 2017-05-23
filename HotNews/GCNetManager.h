//
//  GCNetManager.h
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCNetManager : NSObject
@property (nonatomic,strong) id data;
+(GCNetManager*)defaultManager;
-(id)getDataWithUrl:(NSString*)url;

@end
