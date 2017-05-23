//
//  GCSegmentViewController.h
//  GCSegment
//
//  Created by GaoChao on 2017/4/5.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCSegmentViewController : UIViewController
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *controllerArray;
@property (nonatomic, strong) UIScrollView *scroll;

- (void)setTheTextColor:(UIColor *)textColor sliderColor:(UIColor *)sliderColor;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewSelectToIndex:(UIButton *)button;
- (void)selectButton:(NSInteger)index;

@end
