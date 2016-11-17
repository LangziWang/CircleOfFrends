//
//  MyModel.h
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyModel : NSObject

@property (copy,nonatomic) NSMutableArray* imageArray;
@property (strong,nonatomic) NSMutableArray* strArray;
@property (strong,nonatomic) NSString* textString;
@property (strong,nonatomic) NSString* imageUrl;
@property (strong,nonatomic) NSString* timeString;
@property (strong,nonatomic) NSString* nameString;
@property (strong,nonatomic) UIImage* image;

@end
