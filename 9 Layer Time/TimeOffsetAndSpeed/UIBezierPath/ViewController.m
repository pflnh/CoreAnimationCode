//
//  ViewController.m
//  UIBezierPath
//
//  Created by lzw on 15/10/2.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UISlider *timeOffsetSlider;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UILabel *timeOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (strong, nonatomic) UIBezierPath *bezierPath;
@property (strong, nonatomic) CALayer *shipLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(300, 150) controlPoint1:CGPointMake(75, 0) controlPoint2:CGPointMake(225, 300)];
    self.bezierPath = bezierPath;
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3;
    [self.containerView.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(0, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"Ship"].CGImage;
    self.shipLayer = shipLayer;
    
    [self.containerView.layer addSublayer:shipLayer];

}

- (IBAction)updateSlider:(id)sender {
    CFTimeInterval timeOffset = self.timeOffsetSlider.value;
    self.timeOffsetLabel.text = [NSString stringWithFormat:@"%0.2f", timeOffset];
    
    float speed = self.speedSlider.value;
    self.speedLabel.text = [NSString stringWithFormat:@"%0.2f", speed];
}

- (IBAction)play:(id)sender {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 1;
    animation.timeOffset = self.timeOffsetSlider.value;
    animation.speed = self.speedSlider.value;
    animation.path = self.bezierPath.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    [self.shipLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
