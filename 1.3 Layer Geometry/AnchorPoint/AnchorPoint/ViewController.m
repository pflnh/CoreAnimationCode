//
//  ViewController.m
//  AnchorPoint
//
//  Created by lzw on 15/9/20.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10, 10, 40, 50);
    layer.backgroundColor = [UIColor greenColor].CGColor;
    layer.anchorPoint = CGPointMake(0, 0);
    [self.layerView.layer addSublayer:layer];
    
    
    NSLog(@"frame: %@", NSStringFromCGRect(layer.frame));
    NSLog(@"bounds: %@", NSStringFromCGRect(layer.bounds));
    NSLog(@"position: %@", NSStringFromCGPoint(layer.position));
    NSLog(@"anchorPoint: %@", NSStringFromCGPoint(layer.anchorPoint));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
