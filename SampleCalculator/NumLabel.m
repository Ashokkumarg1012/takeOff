//
//  NumLabel.m
//  SampleCalculator
//
//  Created by rayfields on 2014/05/24.
//  Copyright (c) 2014年 Hivelocity inc. All rights reserved.
//

#import "NumLabel.h"

@implementation NumLabel

- (void)drawTextInRect:(CGRect)rect
{
    UIEdgeInsets insets = {0, 10, 0, 10};
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
