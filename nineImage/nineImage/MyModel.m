//
//  MyModel.m
//  nineImage
//
//  Created by Secret Wang on 2016/11/3.
//  Copyright © 2016年 Secret. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

-(instancetype)init{
    self = [super init];
    if (self) {
        _imageArray = [[NSMutableArray alloc]init];
        _strArray = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
