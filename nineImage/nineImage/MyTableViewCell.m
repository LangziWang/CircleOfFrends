//
//  MyTableViewCell.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UILabel+sizeToFit.h"

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createView];
    }
    return self;
}
-(void)createView{
    _headImage = [[UIImageView alloc]init];
    _headImage.frame = CGRectMake(10, 5, SCREEN_SIZE.width*0.12, SCREEN_SIZE.width*0.12);
    _headImage.backgroundColor = [UIColor redColor];
    _headImage.layer.masksToBounds = YES;
    _headImage.layer.cornerRadius = _headImage.frame.size.width /2;
    [self.contentView addSubview:_headImage];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImage.frame)+5, _headImage.frame.origin.y, 0, _headImage.frame.size.height*0.5)];
    _nameLabel.text = @"姓名";
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.frame = CGRectMake(CGRectGetMaxX(_headImage.frame)+5, CGRectGetMaxY(_nameLabel.frame), 0, 0);
    _timeLabel.font = [UIFont systemFontOfSize:14.0f];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_timeLabel];
    
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_headImage.frame), SCREEN_SIZE.width-20, 0)];
    _textLable.numberOfLines = 0;
    _textLable.textAlignment = NSTextAlignmentLeft;
    _textLable.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_textLable];
    
    _MyView = [[NineImageView alloc]init];
    _MyView.frame = CGRectMake(20, CGRectGetMaxY(_textLable.frame), SCREEN_SIZE.width-40, SCREEN_SIZE.width-40);
    _MyView.delegate = self;
    [self.contentView addSubview:_MyView];
}

-(void)configModel:(MyModel *)model{
    [self createView];
    _MyView.model = model;
    _headImage.image = [UIImage imageNamed:model.imageUrl];
    _nameLabel.text = model.nameString;
    _MyView.imageArray = model.imageArray;
    _textLable.text = model.textString;
    _timeLabel.text = model.timeString;
    [_nameLabel sizeToFit];
    [_textLable sizeToFit];
    [_timeLabel sizeToFit];
    _MyView.frame = CGRectMake(_MyView.frame.origin.x, CGRectGetMaxY(_textLable.frame)+5, _MyView.frame.size.width, _MyView.frame.size.height);
}
+(CGFloat)cellHeight:(MyModel *)model
{
    CGFloat height;
    CGSize size = [UILabel sizeWithString:model.textString AndFont:14.0f WithCOntentSize:CGSizeMake(SCREEN_SIZE.width-20, CGFLOAT_MAX)];
    
    if (model.imageArray.count<=3) {
        height = (SCREEN_SIZE.width-40)/3;
    }else if (model.imageArray.count<=6){
        height = (SCREEN_SIZE.width-40)/3*2;
    }else{
        height = (SCREEN_SIZE.width-40);
    }
    return height+size.height + SCREEN_SIZE.width*0.12+20;
}

//-(CGSize)sizeWithString:(NSString*)string font:(UIFont*)f{
////    UIFont *font = [UIFont systemFontOfSize:f];
//    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:f,NSFontAttributeName,nil];
//    CGSize textLabelSize = [string boundingRectWithSize:CGSizeMake(SCREEN_SIZE.width-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//    return textLabelSize;
//}

-(void)tapGestureTouch:(NSInteger)index andModel:(MyModel *)array{
    if ([_delegate respondsToSelector:@selector(tapGestureTouch: andModel:)]) {
        [_delegate tapGestureTouch:index andModel:array];
    }
}


@end