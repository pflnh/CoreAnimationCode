//
//  ViewController.m
//  GroupOpacity
//
//  Created by lzw on 15/9/23.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

+ (UIButton *)customButton {
    CGRect frame = CGRectMake(0, 0, 150, 50);
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 10;
    
    frame = CGRectMake(20, 10, 110, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = @"Hello world";
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button1 = [[self class] customButton];
    button1.center = CGPointMake(50, 50);
    [self.containerView addSubview:button1];
    
    
    UIButton *button2 = [[self class] customButton];
    button2.center = CGPointMake(300, 50);
    button2.alpha = 0.5;
    [self.containerView addSubview:button2];
    
//   Not effect, weird
//   button2.layer.shouldRasterize = YES;
//   button2.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
