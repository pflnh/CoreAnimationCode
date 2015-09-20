//
//  ViewController.m
//  LayerContent
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
    
    UIImage *image = [UIImage imageNamed:@"Snowman"];
    self.layerView.layer.contents = (__bridge id)image.CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityResizeAspect;
    self.layerView.layer.contentsGravity = kCAGravityResizeAspectFill;
//    self.layerView.layer.contentsScale = image.scale;
    self.layerView.layer.contentsScale = [UIScreen mainScreen].scale;
//    self.layerView.layer.masksToBounds = YES;
    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
