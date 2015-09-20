//
//  ViewController.m
//  ContentsCenter
//
//  Created by lzw on 15/9/20.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *button1;
@property (weak, nonatomic) IBOutlet UIView *button2;

@end

@implementation ViewController

- (void)addStretchableImage:(UIImage *)image WithContentRect:(CGRect)rect toLayer:(CALayer *)layer {
    layer.contents = (__bridge id)image.CGImage;
    layer.contentsCenter = rect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image = [UIImage imageNamed:@"GreenBigBtn"];
    [self addStretchableImage:image WithContentRect:CGRectMake(0, 0, 1, 1) toLayer:self.button1.layer];
    [self addStretchableImage:image WithContentRect:CGRectMake(0.25, 0.25, 0.5, 0.5) toLayer:self.button2.layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
