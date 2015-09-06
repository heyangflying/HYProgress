//
//  HYProgressView.h
//  HYProgress
//
//  Created by heyang on 15/8/3.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYProgressView : UIView

/**
 *  进度值 [0,1]
 */
@property (nonatomic,assign) float progress;//进度

/*
 * 线条颜色
 */
@property (nonatomic,strong) UIColor *progressColor;

/*
 * 线条宽度
 */
@property (nonatomic,assign) CGFloat progressWidth;

/*
 * 字体颜色
 */
@property (nonatomic,strong) UIColor *textColor;

/*
 * 字体大小
 */
@property (nonatomic) float textFont;
//+ (void)showInView:(UIView *)view;

@end
