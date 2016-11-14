//
//  NineImageView.h
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"
//
@protocol NineImageViewDelegate <NSObject>
-(void)tapGestureTouch:(NSInteger)index andModel:(MyModel*)array;
@end

@interface NineImageView : UIView
@property (strong,nonatomic) MyModel *model;
@property (strong,nonatomic) NSMutableArray *imageArray;
@property (assign,nonatomic) id<NineImageViewDelegate> delegate;

@end
