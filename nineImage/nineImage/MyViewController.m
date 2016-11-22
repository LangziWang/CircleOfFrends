//
//  MyViewController.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/11.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "MyViewController.h"
#import "FrendsController.h"
#import "TwoViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabbar];
}
-(void)createTabbar{
    FrendsController* vc1 = [[FrendsController alloc]init];
    TwoViewController* vc2 = [[TwoViewController alloc]init];
    
    UINavigationController* nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    UINavigationController* nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
     vc1.title = @"发现";
    vc2.title = @"文字";
    self.viewControllers = @[nav1,nav2];
}

@end
