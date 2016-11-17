//
//  BackImageCell.h
//  nineImage
//
//  Created by Secret Wang on 2016/11/15.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@protocol BackImageDelegate <NSObject>

-(void)singleTouch;

@end

@interface BackImageCell : UITableViewCell

@property (strong,nonatomic) UIImageView* backgroundImage;
@property (strong,nonatomic) UILabel* nameLabel;
@property (strong,nonatomic) UIImageView* headImage;

@property (assign,nonatomic) id<BackImageDelegate> delegate;


-(void)configModel:(UIImage*)model;

@end
