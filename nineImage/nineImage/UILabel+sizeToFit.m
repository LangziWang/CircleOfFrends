//
//  UILabel+sizeToFit.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/14.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "UILabel+sizeToFit.h"

@implementation UILabel (sizeToFit)
+(CGSize)sizeWithString:(NSString *)text AndFont:(CGFloat)font WithCOntentSize:(CGSize )constraintSize{
    UIFont *fon = [UIFont systemFontOfSize:font];
    NSDictionary *attrs = @{NSFontAttributeName :fon};
    CGSize textLabelSize = [text boundingRectWithSize:constraintSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
    return textLabelSize;
}
@end
