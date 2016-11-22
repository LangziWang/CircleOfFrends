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
    [self.contentView addSubview:_headImage];
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImage.frame)+5, _headImage.frame.origin.y, 0, _headImage.frame.size.height*0.5)];
    _nameLabel.text = @"姓名";
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_nameLabel];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:14.0f];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_timeLabel];
    
    _textLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_headImage.frame)+5, CGRectGetMaxY(_nameLabel.frame), SCREEN_SIZE.width-CGRectGetMaxX(_headImage.frame)-15, 0)];
    _textLable.numberOfLines = 0;
    _textLable.textAlignment = NSTextAlignmentLeft;
    _textLable.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_textLable];
    
    _MyView = [[NineImageView alloc]init];
    _MyView.frame = CGRectMake(CGRectGetMaxX(_headImage.frame)+5, CGRectGetMaxY(_textLable.frame), SCREEN_SIZE.width-CGRectGetMaxX(_headImage.frame)-15,SCREEN_SIZE.width-CGRectGetMaxX(_headImage.frame)-15);
    _MyView.delegate = self;
    [self.contentView addSubview:_MyView];
    
    _zanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_zanButton setTitle:@"赞" forState:UIControlStateNormal];
    [_zanButton addTarget:self action:@selector(zanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_zanButton];
    
    _zanView = [[UIView alloc]init ];
    _zanView.backgroundColor = [UIColor blackColor];
    _zanView.alpha = 0.6;
    _zanView.layer.masksToBounds = YES;
    _zanView.layer.cornerRadius  = 5;
    [self.contentView addSubview:_zanView];
    
    UIButton* Dzan = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Dzan.frame = CGRectMake(0, 0, 50, 30);
    [Dzan setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Dzan setTitle:@"赞" forState:UIControlStateNormal];
    [Dzan addTarget:self action:@selector(dianzan) forControlEvents:UIControlEventTouchUpInside];
    [_zanView addSubview:Dzan];
    
    UIView* line = [[UIView alloc]initWithFrame:CGRectMake(50, 5, 1, 20)];
    line.backgroundColor = [UIColor whiteColor];
    [_zanView addSubview:line];
    
    UIButton* zan = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zan.frame = CGRectMake(50, 0, 50, 30);
    [zan setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [zan setTitle:@"评论" forState:UIControlStateNormal];
    [zan addTarget:self action:@selector(dianzan) forControlEvents:UIControlEventTouchUpInside];
    [_zanView addSubview:zan];
    
     _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lineView];
}
-(void)dianzan{
    
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
-(void)layoutSubviews{
    _lineView.frame = CGRectMake(0, self.contentView.frame.size.height-1, SCREEN_SIZE.width, 1);
    _timeLabel.frame = CGRectMake(CGRectGetMaxX(_headImage.frame)+5, _lineView.frame.origin.y-40, 100, 30);
    _zanButton.frame = CGRectMake(SCREEN_SIZE.width-50, _timeLabel.frame.origin.y, 40, 30);
    _zanView.frame  = CGRectMake(SCREEN_SIZE.width -50, _zanButton.frame.origin.y, 0, 30);
}
+(CGFloat)cellHeight:(MyModel *)model
{
    CGFloat height;
    CGSize size = [UILabel sizeWithString:model.textString AndFont:14.0f WithCOntentSize:CGSizeMake(SCREEN_SIZE.width*0.88-25, CGFLOAT_MAX)];
    if (model.imageArray.count == 0) {
        height = 0;
    }else if (model.imageArray.count<=3) {
        height = (SCREEN_SIZE.width*0.85)/3;
    }else if (model.imageArray.count<=6){
        height = (SCREEN_SIZE.width*0.85)/3*2;
    }else{
        height = (SCREEN_SIZE.width*0.85);
    }
    return height+size.height + SCREEN_SIZE.width*0.12 + 30;
}
-(void)zanButtonClick:(UIButton*)sender{
    
    if (_isShow) {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = _zanView.frame;
            frame.origin.x = SCREEN_SIZE.width - 50;
            frame.size.width = 0;
            _zanView.frame = frame;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = _zanView.frame;
            frame.origin.x = SCREEN_SIZE.width - 50 - 100;
            frame.size.width = 100;
            _zanView.frame = frame;
        }];
    }
    _isShow = !_isShow;
}

-(void)tapGestureTouch:(NSInteger)index andModel:(MyModel *)array{
    if ([_delegate respondsToSelector:@selector(tapGestureTouch: andModel:)]) {
        [_delegate tapGestureTouch:index andModel:array];
    }
}


@end
