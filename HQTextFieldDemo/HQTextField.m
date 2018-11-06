//
//  HQTextField.m
//  HQTextFieldDemo
//
//  Created by Mr_Han on 2018/10/10.
//  Copyright © 2018年 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQTextField.h"

@interface HQTextField ()

@property (nonatomic, strong) CAShapeLayer *warnLayer;

@end

@implementation HQTextField

#pragma mark -- 警示框

- (void)createAlertLayer {
    // 设置layer相关属性
    self.warnLayer = [CAShapeLayer layer];
    // 大小和文本框一致
    self.warnLayer.frame = self.bounds;
    // 画线 非圆角
    self.warnLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.warnLayer.bounds cornerRadius:0].CGPath;
    // 线宽
    self.warnLayer.lineWidth = 6. / [[UIScreen mainScreen] scale];
    // 设置为实线
    self.warnLayer.lineDashPattern = nil;
    // 填充颜色透明色
    self.warnLayer.fillColor = [UIColor clearColor].CGColor;
    // 边框颜色为红色
    self.warnLayer.strokeColor = [UIColor redColor].CGColor;
    
    [self.layer addSublayer:self.warnLayer];
}

- (void)showWarn {
    [self createAlertLayer];
    
    // 透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opacityAnimation.repeatCount = 5;
    opacityAnimation.repeatDuration = 2;
    opacityAnimation.autoreverses = YES;
    [self.warnLayer addAnimation:opacityAnimation forKey:@"opacity"];
    
    // 2秒后移除动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 2秒后异步执行这里的代码...
        // 移除动画
        [self.warnLayer removeFromSuperlayer];
    });
}

#pragma mark -- 改变光标起始位置

// 控制placeHolder的位置，左右缩20，但是光标位置不变
/*
 - (CGRect)placeholderRectForBounds:(CGRect)bounds
 {
 CGRect inset = CGRectMake(bounds.origin.x+100, bounds.origin.y, bounds.size.width -10, bounds.size.height);//更好理解些
 return inset;
 }
 */
// 修改文本展示区域，一般跟editingRectForBounds一起重写
- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width-25, bounds.size.height);//更好理解些
    return inset;
}
// 重写来编辑区域，可以改变光标起始位置，以及光标最右到什么地方，placeHolder的位置也会改变
- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+10, bounds.origin.y, bounds.size.width-25, bounds.size.height);//更好理解些
    return inset;
}


@end
