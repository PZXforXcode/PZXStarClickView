# PZXStarClickView
一款星星点赞控件。根据网上代码模仿修改封装的。方便自己在项目中使用。
# 效果图
![image](https://github.com/PZXforXcode/PZXStarClickView/blob/master/PZXStarClickView/showDemo.gif)
# 使用方法
##首先将文件中的PZXStarClickViewControl拷贝进你的工程。然后 >import PZXStarClickView.h。
### Usage:
```Objective-C
    //这是用storyBoard建立的
    _pzxstarClickView.allowIsDecimalStar = YES;
    _pzxstarClickView.isAnimagioin = YES;
    
    _pzxstarClickView1 = [[PZXStarClickView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 57) numberOfStars:5];
    [self.view addSubview:_pzxstarClickView1];
    
 //delegate
    -(void)pzxStarClickView:(PZXStarClickView *)starView clickStarPrecent:(CGFloat)percent{
    
    NSLog(@"%f",percent);
    
}
```
