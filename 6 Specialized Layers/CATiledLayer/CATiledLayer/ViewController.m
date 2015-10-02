//
//  ViewController.m
//  CATiledLayer
//
//  Created by lzw on 15/9/30.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
//    tileLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.scrollView.layer addSublayer:tileLayer];
    
    self.scrollView.contentSize = tileLayer.frame.size;
    
    [tileLayer setNeedsDisplay];
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx {
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    NSLog(@"bounds: %@", NSStringFromCGRect(bounds));
    NSLog(@"tileSize: %@", NSStringFromCGSize(layer.tileSize));
    
    NSInteger x = floor(bounds.origin.x / layer.tileSize.width);
    NSInteger y = floor(bounds.origin.y / layer.tileSize.height);
    
//    CGFloat scale = [UIScreen mainScreen].scale;
//    NSInteger x = floor(bounds.origin.x / layer.tileSize.width * scale);
//    NSInteger y = floor(bounds.origin.y / layer.tileSize.height * scale);
    
    NSString *imageName = [NSString stringWithFormat:@"Snowman_%02ld_%02ld", x, y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
