//
//  SinglePixelView.m
//  SinglePixelView
//
//  Created by Wang on 15/9/24.
//  Copyright © 2015年 Wang. All rights reserved.
//

#import "SinglePixelView.h"

#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)

@implementation SinglePixelView

+ (instancetype)createWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor{
    SinglePixelView *view = [[SinglePixelView alloc] initWithFrame:frame lineColor:lineColor];
    return view;
}
- (instancetype)initWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor{
    if(self = [super initWithFrame:frame]){
        _lineColor = lineColor;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame lineColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]];
}

- (void)setLineColor:(UIColor *)lineColor{
    if(lineColor != _lineColor){
        _lineColor = lineColor;
        [self setNeedsDisplay];
    }
}
- (void)awakeFromNib{
    if(!_lineColor)_lineColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    [self.lineColor setStroke];
    CGContextMoveToPoint(context, 0, SINGLE_LINE_ADJUST_OFFSET);
    CGContextAddLineToPoint(context, CGRectGetWidth(rect), SINGLE_LINE_ADJUST_OFFSET);
    CGContextSetLineWidth(context, SINGLE_LINE_WIDTH);
    CGContextStrokePath(context);
}


@end
