//
//  HYProgressView.m
//  HYProgress
//
//  Created by heyang on 15/8/3.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import "HYProgressView.h"

@interface HYProgressView ()

@property (nonatomic) float progressR;
@property (nonatomic) float progressG;
@property (nonatomic) float progressB;

@end

@implementation HYProgressView


// 绘制进度圈
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGFloat textH = 20;
    CGFloat textW = 100;
    CGFloat viewW = rect.size.width;
    CGFloat viewH = rect.size.height;
    
    CGFloat textX = (viewW - textW) * 0.5;
    CGFloat textY = (viewH - textH) * 0.5;
    
    // 1.画文字
    NSString *text = [NSString stringWithFormat:@"   %.0f %@",self.progress * 100,@"%"];
   
    if(self.progress * 100 >= 100){
        text = @"欢迎使用";
    }
    
    // 设置字体的样式
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:self.textFont],NSForegroundColorAttributeName:self.textColor};
    
    NSTextAlignmentToCTTextAlignment(NSTextAlignmentCenter);
    
    [text drawInRect:CGRectMake(textX+20, textY+3, textW, textH) withAttributes:attr];
    
    
    // 2.画弧
    CGContextRef context = UIGraphicsGetCurrentContext();
    
   
    
    // 设置线颜色
    CGContextSetRGBStrokeColor(context, self.progressR, self.progressG, self.progressB, 1);
    
    // 设置线宽
    CGContextSetLineWidth(context, self.progressWidth);
    
    // 设置连接点的样式
    //  CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // 设置线的头尾的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //半径
    CGFloat radius = (viewW - 10) * 0.5;
    
    CGFloat endAngle = self.progress * 2 * M_PI - M_PI_4;
    
    CGContextAddArc(context, viewW * 0.5, viewH * 0.5, radius, - M_PI_4, endAngle, 0);
    CGContextStrokePath(context);
}

- (NSMutableArray *) changeUIColorToRGB:(UIColor *)color
{
    NSMutableArray *RGBStrValueArr = [[NSMutableArray alloc] init];
    NSString *RGBStr = nil;
    //获得RGB值描述
    NSString *RGBValue = [NSString stringWithFormat:@"%@",color];
    //将RGB值描述分隔成字符串
    NSArray *RGBArr = [RGBValue componentsSeparatedByString:@" "];
    //获取红色值
    int r = [[RGBArr objectAtIndex:1] intValue] * 255;
    RGBStr = [NSString stringWithFormat:@"%d",r];
    [RGBStrValueArr addObject:RGBStr];
    //获取绿色值
    int g = [[RGBArr objectAtIndex:2] intValue] * 255;
    RGBStr = [NSString stringWithFormat:@"%d",g];
    [RGBStrValueArr addObject:RGBStr];
    //获取蓝色值
    int b = [[RGBArr objectAtIndex:3] intValue] * 255;
    RGBStr = [NSString stringWithFormat:@"%d",b];
    [RGBStrValueArr addObject:RGBStr];
    //返回保存RGB值的数组
    return RGBStrValueArr;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    //重绘
    [self setNeedsDisplay];
}


- (void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    
    NSArray *rgbArray =  [self changeUIColorToRGB:progressColor];
    
   
    
    _progressR = [rgbArray[0]floatValue] / 255.0;
    _progressG = [rgbArray[1]floatValue] / 255.0;
    _progressB = [rgbArray[2]floatValue] / 255.0;
    
    //重绘
    [self setNeedsDisplay];
    
}



@end
