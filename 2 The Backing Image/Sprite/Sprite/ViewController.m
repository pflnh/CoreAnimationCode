//
//  ViewController.m
//  Sprite
//
//  Created by lzw on 15/9/20.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;
@property (weak, nonatomic) IBOutlet UIView *fourthView;

@end

@implementation ViewController

- (void)addSpriteImage:(UIImage *)image WithContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsGravity = kCAGravityResizeAspect;
    layer.contentsScale = image.scale;
    layer.contentsRect = rect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"Sprites"];
    
    [self addSpriteImage:image WithContentRect:CGRectMake(0, 0, 0.5, 0.5) toLayer:self.firstView.layer];
    
    [self addSpriteImage:image WithContentRect:CGRectMake(0.5, 0, 0.5, 0.5) toLayer:self.secondView.layer];

    [self addSpriteImage:image WithContentRect:CGRectMake(0, 0.5, 0.5, 0.5) toLayer:self.thirdView.layer];
    
    [self addSpriteImage:image WithContentRect:CGRectMake(0.5, 0.5, 0.5, 0.5) toLayer:self.fourthView.layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
