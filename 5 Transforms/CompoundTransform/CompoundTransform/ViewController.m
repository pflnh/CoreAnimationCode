//
//  ViewController.m
//  CompoundTransform
//
//  Created by lzw on 15/9/23.
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
//    
    self.layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"Snowman"].CGImage;
    
//    [self compoundTransform];
//    [self makeShear];
    [self threeDTransform];
}

- (void)compoundTransform {
    CGAffineTransform transform = CGAffineTransformIdentity;
    NSLog(@"%@", NSStringFromCGAffineTransform(transform));
    
    transform = CGAffineTransformScale(transform, 1.6, 1.6);
    NSLog(@"%@", NSStringFromCGAffineTransform(transform));
    
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);
    NSLog(@"%@", NSStringFromCGAffineTransform(transform));
    
    transform = CGAffineTransformTranslate(transform, 50, 0);
    NSLog(@"%@", NSStringFromCGAffineTransform(transform));
    
    self.layerView.layer.affineTransform = transform;
}

CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y) {
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

- (void)makeShear {
    self.layerView.layer.affineTransform = CGAffineTransformMakeShear(1, 0);
}

- (void)threeDTransform {
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = - 1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    self.layerView.layer.transform = transform;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
