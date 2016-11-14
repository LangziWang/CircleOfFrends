//
//  UILabel+sizeToFit.h
//  nineImage
//
//  Created by Secret Wang on 2016/11/14.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (sizeToFit)

+(CGSize)sizeWithString:(NSString*)text AndFont:(CGFloat)font WithCOntentSize:(CGSize)size;

@end
