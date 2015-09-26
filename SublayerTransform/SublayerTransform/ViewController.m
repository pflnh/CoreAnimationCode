//
//  ViewController.m
//  SublayerTransform
//
//  Created by lzw on 15/9/25.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *layerView1;
@property (weak, nonatomic) IBOutlet UIView *layerView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    id image = (__bridge id)[UIImage imageNamed:@"Snowman"].CGImage;
    self.layerView1.layer.contents = image;
    self.layerView2.layer.contents = image;
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500;
    self.containerView.layer.sublayerTransform = perspective;
    
    CATransform3D transform1 = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    self.layerView1.layer.transform = transform1;
    
    CATransform3D transform2 = CATransform3DMakeRotation(- M_PI_4, 0, 1, 0);
    self.layerView2.layer.transform = transform2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
