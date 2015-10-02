//
//  ViewController.m
//  DurationAndRepeatCount
//
//  Created by lzw on 15/10/2.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *durationField;
@property (weak, nonatomic) IBOutlet UITextField *repeatField;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic, strong) CALayer *shipLayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //add the ship
    self.shipLayer = [CALayer layer];
    self.shipLayer.frame = CGRectMake(0, 0, 128, 128);
    self.shipLayer.position = CGPointMake(100, 100);
    self.shipLayer.contents = (__bridge id)[UIImage imageNamed: @"Ship.png"].CGImage;
    [self.containerView.layer addSublayer:self.shipLayer];
}

- (void)setControlEnabled:(BOOL)enabled {
    for (UIControl *control in @[self.durationField, self.repeatField, self.startButton]) {
        control.enabled = enabled;
        control.alpha = enabled? 1.0f:0.5f;
    }
}

- (IBAction)hideKeyboard:(id)sender {
    [self.durationField resignFirstResponder];
    [self.repeatField resignFirstResponder];
}

- (IBAction)start:(id)sender {
    CFTimeInterval duration = [self.durationField.text doubleValue];
    float repeatCount = [self.repeatField.text doubleValue];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.duration = duration;
    animation.repeatCount = repeatCount;
    animation.byValue = @(M_PI * 2);
    animation.delegate = self;
    [self.shipLayer addAnimation:animation forKey:@"rotateAnimation"];
    [self setControlEnabled:NO];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self setControlEnabled:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
