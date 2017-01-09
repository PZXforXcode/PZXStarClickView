//
//  PZXStarClickView.h
//  PZXStarClickView
//
//  Created by 彭祖鑫 on 2017/1/9.
//  Copyright © 2017年 PZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PZXStarClickView;
@protocol PZXStarClickViewDelegate <NSObject>

-(void)pzxStarClickView:(PZXStarClickView *)starView clickStarPrecent:(CGFloat )percent;

@end


@interface PZXStarClickView : UIView

@property (nonatomic, assign) CGFloat score;//评分 在0-1之间
@property (nonatomic ,assign) BOOL isAnimagioin;//是否开启动画
@property (nonatomic, assign) BOOL allowIsDecimalStar;//是否允许不是整数

@property (nonatomic, weak) id<PZXStarClickViewDelegate>delegate;


- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars;


@end
