//
//  ViewController.m
//  ShadowPath
//
//  Created by lzw on 15/9/22.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layerView1.layer.contents = (__bridge id )([UIImage imageNamed:@"Cone"].CGImage);
    self.layerView2.layer.contents = (__bridge id )([UIImage imageNamed:@"Cone"].CGImage);
    
    self.layerView1.layer.shadowOpacity = 0.5;
    self.layerView2.layer.shadowOpacity = 0.5;
    
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, self.layerView1.bounds);
    self.layerView1.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
    CGMutablePathRef circlePath = CGPathCreateMutable();
    CGPathAddEllipseInRect(circlePath, NULL, self.layerView2.bounds);
    self.layerView2.layer.shadowPath = circlePath;
    CGPathRelease(circlePath);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
