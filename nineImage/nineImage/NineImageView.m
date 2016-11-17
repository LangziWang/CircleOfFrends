//
//  NineImageView.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "NineImageView.h"

@implementation NineImageView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _imageArray = [[NSMutableArray alloc]init];
        [self createImageVIew];
    }
    return self;
}
-(void)createImageVIew{
    for (int i=0; i<9; i++) {
        UIImageView* imageView = [[UIImageView alloc]init];
        imageView.tag = 1+i;
        imageView.userInteractionEnabled = YES;
        imageView.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapGesture:)];
        [imageView addGestureRecognizer:singleTap];
        [self addSubview:imageView];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    if (_imageArray.count == 1) {
        UIImageView* image = (UIImageView*)[self viewWithTag:1];
        image.image = [UIImage imageNamed:_imageArray[0]];
        image.frame = CGRectMake(0, 0, (self.frame.size.width-20)/3*2, (self.frame.size.height-20)/3);
    }else {
        for (int i=0; i<_imageArray.count; i++) {
            UIImageView* image = (UIImageView*)[self viewWithTag:i+1];
            image.image = [UIImage imageNamed:_imageArray[i]];
            image.frame = CGRectMake(i%3 * ((self.frame.size.width-20)/3+10), i/3*((self.frame.size.height-20)/3+10), (self.frame.size.width-20)/3, (self.frame.size.height-20)/3);
        }
    }
}

-(void)singleTapGesture:(UITapGestureRecognizer*)sender{
    NSInteger i = sender.view.tag;
    if ([_delegate respondsToSelector:@selector(tapGestureTouch: andModel:)]) {
        [_delegate tapGestureTouch:i andModel:_model];
    }
}

@end
