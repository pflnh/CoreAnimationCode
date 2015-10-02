//
//  ViewController.m
//  ShadowClipping
//
//  Created by lzw on 15/9/22.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *shadowView;
@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layerView.layer.masksToBounds = YES;
    self.layerView.layer.cornerRadius = 10;
    self.layerView.layer.borderWidth = 5;
    
    self.shadowView.layer.shadowOpacity = 1;
    self.shadowView.layer.shadowRadius = 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
