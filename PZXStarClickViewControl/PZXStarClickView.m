//
//  PZXStarClickView.m
//  PZXStarClickView
//
//  Created by 彭祖鑫 on 2017/1/9.
//  Copyright © 2017年 PZX. All rights reserved.
//

#import "PZXStarClickView.h"

#define FOREGROUND_STAR_IMAGE_NAME @"b27_icon_star_yellow"
#define BACKGROUND_STAR_IMAGE_NAME @"b27_icon_star_gray"
#define DEFALUT_NUMBER 5


@interface PZXStarClickView ()

@property (nonatomic, strong) UIView *foregroundStarView;
@property (nonatomic, strong) UIView *backgroundStarView;

@property (nonatomic, assign) NSInteger numberOfStars;



@end

@implementation PZXStarClickView
#pragma mark - 初始化方法
-(instancetype)initWithFrame:(CGRect)frame{

    return [self initWithFrame:frame numberOfStars:DEFALUT_NUMBER];
    
}

- (instancetype)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)numberOfStars {
    if (self = [super initWithFrame:frame]) {
        _numberOfStars = numberOfStars;
        [self initUserInsterface];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        //用storyBoard就在这里修改frame 宽高度和frame高度一致
        self.frame =CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        _numberOfStars = DEFALUT_NUMBER;
        [self initUserInsterface];
    }
    return self;
}

#pragma mark - 界面UI
-(void)initUserInsterface{

    _score = 1;//默认为1
    _isAnimagioin = NO;//默认为NO
    _allowIsDecimalStar = NO;//默认为NO
    
    self.foregroundStarView = [self createStarViewWithImage:FOREGROUND_STAR_IMAGE_NAME];
    self.backgroundStarView = [self createStarViewWithImage:BACKGROUND_STAR_IMAGE_NAME];
    
    [self addSubview:self.backgroundStarView];
    [self addSubview:self.foregroundStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
    
    
}

- (void)userTapRateView:(UITapGestureRecognizer *)gesture {
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat realStarScore = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat starScore = self.allowIsDecimalStar ? realStarScore : ceilf(realStarScore);
    self.score = starScore / self.numberOfStars;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak PZXStarClickView *weakSelf = self;
    CGFloat animationTimeInterval = self.isAnimagioin ? 0.2 : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foregroundStarView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.score, weakSelf.bounds.size.height);
    }];
}

- (UIView *)createStarViewWithImage:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

-(void)setScore:(CGFloat)score{
    
    if (_score == score) {
        return;
    }
    if (score < 0) {
        _score = 0;
    }else if (score >1){
    
        _score = 1;
    }else{
        _score =score;
    }

    NSLog(@"%f",score);
    if ([self.delegate respondsToSelector:@selector(pzxStarClickView:clickStarPrecent:)]) {
        
        [self.delegate pzxStarClickView:self clickStarPrecent:score];
    }
    [self setNeedsLayout];

}
@end
