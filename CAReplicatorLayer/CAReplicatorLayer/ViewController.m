//
//  ViewController.m
//  CAReplicatorLayer
//
//  Created by lzw on 15/9/29.
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
    
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    
    replicator.instanceCount = 10;
    
    CATransform3D tf = CATransform3DIdentity;
    tf = CATransform3DTranslate(tf, 0, 200, 0);
    tf = CATransform3DRotate(tf, M_PI / 5.0, 0, 0, 1);
    tf = CATransform3DTranslate(tf, 0, -200, 0);
    replicator.instanceTransform = tf;
    
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.f, 100.f, 100.f, 100.f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
