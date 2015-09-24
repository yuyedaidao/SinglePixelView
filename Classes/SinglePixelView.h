//
//  SinglePixelView.h
//  SinglePixelView
//
//  Created by Wang on 15/9/24.
//  Copyright © 2015年 Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePixelView : UIView
@property (nonatomic, strong) IBInspectable UIColor *lineColor;

+ (instancetype)createWithFrame:(CGRect)frame lineColor:(UIColor *)lineColor;

@end
