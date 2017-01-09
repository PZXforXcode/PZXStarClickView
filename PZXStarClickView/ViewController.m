//
//  ViewController.m
//  PZXStarClickView
//
//  Created by 彭祖鑫 on 2017/1/9.
//  Copyright © 2017年 PZX. All rights reserved.
//

#import "ViewController.h"
#import "PZXStarClickView.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet PZXStarClickView *pzxstarClickView;


@property (strong, nonatomic)  PZXStarClickView *pzxstarClickView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这是用storyBoard建立的
    _pzxstarClickView.allowIsDecimalStar = YES;
    _pzxstarClickView.isAnimagioin = YES;
    
    
    _pzxstarClickView1 = [[PZXStarClickView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 57) numberOfStars:5];
    [self.view addSubview:_pzxstarClickView1];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
