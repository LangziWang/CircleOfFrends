//
//  MyTableViewCell.h
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NineImageView.h"
#import "MyModel.h"

@interface MyTableViewCell : UITableViewCell<NineImageViewDelegate>

@property (strong,nonatomic) NSMutableArray* array;

@property (strong,nonatomic) UILabel* nameLabel;
@property (strong,nonatomic) UILabel*timeLabel;
@property (strong,nonatomic) UIImageView* headImage;
@property (strong,nonatomic) NineImageView *MyView;
@property (strong,nonatomic) UILabel* textLable;

@property (assign,nonatomic) id<NineImageViewDelegate> delegate;



-(void)configModel:(MyModel*)model;
+(CGFloat)cellHeight:(MyModel *)model;

@end
