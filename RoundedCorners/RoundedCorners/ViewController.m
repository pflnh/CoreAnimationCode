//
//  ViewController.m
//  RoundedCorners
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
    
    self.layerView1.layer.cornerRadius = 20;
    self.layerView2.layer.cornerRadius = 20;
    
    self.layerView1.layer.borderWidth = 5;
    self.layerView2.layer.borderWidth = 5;
    
    self.layerView2.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
