//
//  TwoViewController.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/11.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "TwoViewController.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}
-(void)createUI{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    label.text = @"今天下午全市多云到阴有阵雨或雷雨，今天夜里到明天阴有阵雨，雨量可达大雨。 东北风5-6级阵风7级，逐渐增强到6-7级阵风8级。 今天最高气温:26左右， 明晨最低气温:22左右。 今晨最低气温:21。 今日紫外线等级:2级，照射强度弱，适当防护。 明日洗车指数:4级，天气有雨，不宜洗车。";
    //清空背景颜色
//    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:14.0f];
    //设置字体颜色为白色
    label.textColor = [UIColor whiteColor];
    //设置label的背景色为黑色
    label.backgroundColor = [UIColor blackColor];
//    文字居中显示
////    label.textAlignment = UITextAlignmentCenter;
////    //自动折行设置
////    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;

    //自适应高度
    CGRect txtFrame = label.frame;
    
    label.frame = CGRectMake(10, 100, 300,
                             txtFrame.size.height =[label.text boundingRectWithSize:
                                                    CGSizeMake(SCREEN_SIZE.width-20, CGFLOAT_MAX)
                                                                            options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                         attributes:[NSDictionary dictionaryWithObjectsAndKeys:label.font,NSFontAttributeName, nil] context:nil].size.height);
    label.frame = CGRectMake(10, 100, SCREEN_SIZE.width-20, txtFrame.size.height);
    
//    [label sizeToFit];
    
    [self.view addSubview:label];
}



@end
