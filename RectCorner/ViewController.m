//
//  ViewController.m
//  RectCorner
//
//  Created by Mac on 2019/1/18.
//  Copyright © 2019年 Mac. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *topView = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 50)];
    topView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:topView];
    
    
    topView.layer.mask = [self configRectCorner:topView corners:UIRectCornerTopLeft | UIRectCornerTopRight| UIRectCornerBottomLeft | UIRectCornerBottomRight radii:CGSizeMake(5, 5)];
}


/**
 设置圆角

 @param view 需要设置圆角的控件
 @param corners 哪个圆角
 @param radii 圆角size
 @return layer图层
 */
-(CALayer *)configRectCorner:(UIView *)view corners:(UIRectCorner)corners radii:(CGSize)radii{
    
    /*
     typedef NS_OPTIONS(NSUInteger, UIRectCorner) {
     UIRectCornerTopLeft     = 1 << 0,
     UIRectCornerTopRight    = 1 << 1,
     UIRectCornerBottomLeft  = 1 << 2,
     UIRectCornerBottomRight = 1 << 3,
     UIRectCornerAllCorners  = ~0UL
     };
     
     ~0UL 相当于  -1
     */
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners  cornerRadii:radii];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    
    return maskLayer;
}

@end
