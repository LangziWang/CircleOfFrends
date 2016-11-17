//
//  BackImageCell.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/15.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "BackImageCell.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
@implementation BackImageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    _backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height*0.38)];
    _backgroundImage.backgroundColor = [UIColor redColor];
    _backgroundImage.userInteractionEnabled = YES;
    _backgroundImage.image = [UIImage imageNamed:@"q4.jpg"];
    [self.contentView addSubview:_backgroundImage];
    UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapgestureTouch:)];
    [_backgroundImage addGestureRecognizer:singleTap];
    
    _headImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_SIZE.width*0.8, CGRectGetMaxY(_backgroundImage.frame)-SCREEN_SIZE.width*0.12, SCREEN_SIZE.width*0.17, SCREEN_SIZE.width*0.17)];
    UITapGestureRecognizer* headTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTapgestureTouch:)];
    [_headImage addGestureRecognizer:headTap];
    _headImage.image = [UIImage imageNamed:@"q3.jpg"];
    [self.contentView addSubview:_headImage];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _headImage.frame.origin.y, SCREEN_SIZE.width*0.75, SCREEN_SIZE.width*0.12)];
    _nameLabel.textAlignment = NSTextAlignmentRight;
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.text = @"迷你";
    [self.contentView addSubview:_nameLabel];
    
}

-(void)singleTapgestureTouch:(UITapGestureRecognizer*)sender{
    if ([_delegate respondsToSelector:@selector(singleTouch)]) {
        [_delegate singleTouch];
    }
}

-(void)configModel:(UIImage *)model{
    if (model) {
        _backgroundImage.image = model;
    }
}



@end
