//
//  CalculatorViewController.m
//  SampleCalculator
//
//  Created by rayfields on 2014/05/23.
//  Copyright (c) 2014年 Hivelocity inc. All rights reserved.
//

#import "CalculatorViewController.h"


@interface CalculatorViewController ()

@end

@implementation CalculatorViewController{
    NSInteger _numStock;
    NSString *_calcType;
    NSInteger _total;
    BOOL _typing;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _label.text = @"0";
    _label.textAlignment = NSTextAlignmentRight;
    _label.font = [UIFont boldSystemFontOfSize:40.0f];
    
    _calcType = @"default";
    _numStock = 0;
    _typing = YES;
    _total = 0;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 数字ボタン
- (IBAction)numButtonAction:(id)sender
{
    
    NSString* num = [NSString stringWithFormat:@"%ld", (long)((UIButton*)sender).tag];
    
    if(_typing == YES){
        
        NSString* appendNum = [[self deleteComma:_label.text] stringByAppendingString:num];
        NSString* formatNum = [self addComma:[appendNum integerValue]];
        _label.text = formatNum;
        
    }else{
        _label.text = num;
        _typing = YES;
    }
    
}


// 計算系ボタン
- (IBAction)calcAction:(UIButton*)sender
{
    
    
    if ([_calcType isEqual:@"plus"]) {
        
        [self addition];
        
    }else if ([_calcType isEqual:@"minus"]) {
        
        [self subtraction];
        
    }
    
    if(sender.tag == 0){
        
        //[self addition];
        _typing = NO;
        _calcType = @"plus";
    }else{
        
        //[self subtraction];
        _typing = NO;
        _calcType = @"minus";
    }
    
    
    
    
    _numStock = [[self deleteComma:_label.text] integerValue];
    NSLog(@"Stock: %ld", (long)_numStock);
    

}


// 合計ボタン
- (IBAction)equalAction:(id)sender
{
    
    if ([_calcType isEqual:@"plus"]) {
        
        [self addition];
        
    }else if ([_calcType isEqual:@"minus"]) {
        
        [self subtraction];
        
    }
    
    _typing = NO;
    _numStock = 0;

}


// クリアボタン
- (IBAction)clearAction:(id)sender
{
    
    _numStock = 0;
    _calcType = @"default";
    _typing = YES;
    _label.text = @"0";
    _total = 0;
    
}


// 足し算
- (void)addition
{
    _total = _numStock + [[self deleteComma:_label.text] integerValue];
    _label.text = [self addComma:_total];
}


// 引き算
- (void)subtraction
{
    _total = _numStock - [[self deleteComma:_label.text] integerValue];
    if(_numStock != 0){
        _label.text = [self addComma:_total];
    }
}


// カンマを追加します
- (NSString *)addComma:(NSInteger)targetNumber
{
    NSNumberFormatter *_format = [[NSNumberFormatter alloc] init];
    [_format setNumberStyle:NSNumberFormatterDecimalStyle];
    [_format setGroupingSeparator:@","];
    [_format setGroupingSize:3];
    
    return [_format stringForObjectValue:[NSNumber numberWithInteger:targetNumber]];
}


// カンマを取り除きます
- (NSString *)deleteComma:(NSString *)targetString;
{
    NSString *_mysetString = [NSString stringWithFormat:@"%@",targetString];
    NSString *_mysetString2= [_mysetString stringByReplacingOccurrencesOfString:@"," withString:@""];
    return _mysetString2;
}


@end
