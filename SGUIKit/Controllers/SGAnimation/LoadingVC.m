//
//  LoadingVC.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/23.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "LoadingVC.h"

static const CGFloat kLayerSizeValue = 60;
//static const CGFloat kPathLineWidth = 6;
//static const CGFloat kAnimationDuration = 1.5;

@interface LoadingVC ()
@property(nonatomic, strong) CALayer *line1;
@property(nonatomic, strong) CALayer *line2;

@end

@implementation LoadingVC
{
    CAShapeLayer *_shapeLayer1;
    CAShapeLayer *_shapeLayer2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

-(void)initViews{
    UIView *animation1 = [self animationView1];
    animation1.frame = CGRectMake(self.view.center.x - 96/2, 80, 96, 30);
    [self.view addSubview:animation1];
    [self initSubviews];
    [self beginAnimation];
    

}
- (void)beginAnimation {
    
    // layer1
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation1.duration = 1.5;
    animation1.fromValue = @0;
    animation1.toValue = @(M_PI * 2);
    animation1.repeatCount = INFINITY; // HUGE
    [_shapeLayer1 addAnimation:animation1 forKey:nil];
    
    // layer2
    
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(-0.5);
    startAnimation.toValue = @(1);
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(0);
    endAnimation.toValue = @(1);
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[startAnimation, endAnimation];
    groupAnimation.duration = 1.5;
    groupAnimation.repeatCount = INFINITY;
    [_shapeLayer2 addAnimation:groupAnimation forKey:nil];

}

- (void)initSubviews{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, kLayerSizeValue, kLayerSizeValue)];
    _shapeLayer1 = [CAShapeLayer layer];
    _shapeLayer1.strokeColor = K_YELLOW_color.CGColor;
    _shapeLayer1.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer1.lineCap = kCALineCapRound;
    _shapeLayer1.strokeStart = 0;
    _shapeLayer1.strokeEnd = 0.4;
    _shapeLayer1.lineWidth = 6;
    _shapeLayer1.path = path.CGPath;
    [self.view.layer addSublayer:_shapeLayer1];
    
    _shapeLayer2 = [CAShapeLayer layer];
    _shapeLayer2.strokeColor = K_GREEN_color.CGColor;
    _shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer2.lineCap = kCALineCapRound;
    _shapeLayer2.strokeStart = -0.5;
    _shapeLayer2.strokeEnd = 0;
    _shapeLayer2.lineWidth = 6;
    _shapeLayer2.path = path.CGPath;
    [self.view.layer addSublayer:_shapeLayer2];

    
    
    
    CGFloat lineSpace = 40;
    CGFloat minY = lineSpace;
    
    _shapeLayer1.frame = CGRectMake(150, 80 + minY, kLayerSizeValue, kLayerSizeValue);
    
    minY = CGRectGetMaxY(_shapeLayer1.frame) + lineSpace;
    
    
    minY = CGRectGetMaxY(self.line1.frame) + lineSpace;
    
    _shapeLayer2.frame = CGRectMake(150, 180 + minY, kLayerSizeValue, kLayerSizeValue);
    
    minY = CGRectGetMaxY(_shapeLayer2.frame) + lineSpace;
    

}

- (UIView *)animationView1 {
    
    UIView *animationView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 95, 30)];
    
    UIView  *shapeView1= [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView1.layer.cornerRadius = 8;
    [animationView1 addSubview:shapeView1];
    
    UIView *shapeView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView2.layer.cornerRadius = 8;
    [animationView1 addSubview:shapeView2];
    
    UIView *shapeView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 7, 16, 16)];
    shapeView3.layer.cornerRadius = 8;
    [animationView1 addSubview:shapeView3];
    
    shapeView1.backgroundColor = K_RED_color;
    shapeView2.backgroundColor = K_YELLOW_color;
    shapeView3.backgroundColor = K_BLUE_color;
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animation];
    positionAnimation.keyPath = @"position.x";
    positionAnimation.values = @[ @-5, @0, @10, @40, @70, @80, @75 ];
    positionAnimation.keyTimes = @[ @0, @(5 / 90.0), @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @(85 / 90.0), @1 ];
    positionAnimation.additive = YES;
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.values = @[ @.7, @.9, @1, @.9, @.7 ];
    scaleAnimation.keyTimes = @[ @0, @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @1 ];
    
    CAKeyframeAnimation *alphaAnimation = [CAKeyframeAnimation animation];
    alphaAnimation.keyPath = @"opacity";
    alphaAnimation.values = @[ @0, @1, @1, @1, @0 ];
    alphaAnimation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[positionAnimation, scaleAnimation, alphaAnimation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.repeatCount = HUGE_VALF;
    group.duration = 1.3;
    
    [shapeView1.layer addAnimation:group forKey:@"basic1"];
    group.timeOffset = .43;
    [shapeView2.layer addAnimation:group forKey:@"basic2"];
    group.timeOffset = .86;
    [shapeView3.layer addAnimation:group forKey:@"basic3"];
    
    return animationView1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
