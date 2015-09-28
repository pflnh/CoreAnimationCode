//
//  ViewController.m
//  CATransformLayer
//
//  Created by lzw on 15/9/27.
//  Copyright © 2015年 微信: lzwjava. All rights reserved.
//

#import "ViewController.h"

static CGFloat const kCubeSize = 50;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (CALayer *)faceWithTransform:(CATransform3D)transform {
    CALayer *face = [CALayer layer];
    face.frame = CGRectMake(-kCubeSize, -kCubeSize, 2 * kCubeSize, 2 * kCubeSize);
    
    CGFloat red = rand() / (double)INT_MAX;
    CGFloat green = rand() / (double)INT_MAX;
    CGFloat blue = rand() / (double)INT_MAX;
    
    face.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    face.transform = transform;
    return face;
}

- (CALayer *)cubeWithTransform:(CATransform3D)transform {
    CATransformLayer *cube = [CATransformLayer layer];
    
    // cube 1, front face
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, kCubeSize);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // cube 2, right face
    ct = CATransform3DMakeTranslation(kCubeSize, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // top face
    ct = CATransform3DMakeTranslation(0, -kCubeSize, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // bottom face
    ct = CATransform3DMakeTranslation(0, kCubeSize, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // left face
    ct = CATransform3DMakeTranslation(-kCubeSize, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    // behind face
    ct = CATransform3DMakeTranslation(0, 0, -kCubeSize);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithTransform:ct]];
    
    CGSize containterSize = self.containerView.bounds.size;
    cube.position = CGPointMake(containterSize.width / 2, containterSize.height / 2);
    cube.transform = transform;
    
    return cube;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATransform3D pt = CATransform3DIdentity;
    pt.m34 = -1.0/ 500.0;
    self.containerView.layer.sublayerTransform = pt;
    
    CATransform3D clt = CATransform3DIdentity;
    clt = CATransform3DTranslate(clt, - kCubeSize * 2, 0, 0);
    CALayer *cube1 = [self cubeWithTransform:clt];
    [self.containerView.layer addSublayer:cube1];
    
    CATransform3D c2t = CATransform3DIdentity;
    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
    CALayer *cube2 = [self cubeWithTransform:c2t];
    [self.containerView.layer addSublayer:cube2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
