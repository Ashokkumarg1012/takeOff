//
//  NumButton.m
//  SampleCalculator
//
//  Created by rayfields on 2014/05/23.
//  Copyright (c) 2014年 Hivelocity inc. All rights reserved.
//

#import "NumButton.h"

@implementation NumButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Initialization code
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSString* numStr = [NSString stringWithFormat:@"%ld", self.tag];
    [self setTitle:numStr forState:UIControlStateNormal];
}

@end
