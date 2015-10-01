//
//  ViewController.m
//  CAEmitterLayer
//
//  Created by lzw on 15/9/30.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2, emitter.frame.size.height / 2);
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"Spark"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2;
    
    emitter.emitterCells = @[cell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
