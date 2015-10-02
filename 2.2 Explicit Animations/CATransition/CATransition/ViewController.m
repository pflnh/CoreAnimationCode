//
//  ViewController.m
//  CATransition
//
//  Created by lzw on 15/10/2.
//  Copyright © 2015年 lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.images = @[[UIImage imageNamed:@"Anchor"],
                    [UIImage imageNamed:@"Cone"],
                    [UIImage imageNamed:@"Igloo"],
                    [UIImage imageNamed:@"Snowman"]];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)useCATransition {
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    
    [self.imageView.layer addAnimation:transition forKey:nil];
    
    UIImage *currentImage = self.imageView.image;
    NSUInteger index = [self.images indexOfObject:currentImage];
    index = (index + 1) % self.images.count;
    self.imageView.image = self.images[index];
}

- (void)useUIKit {
    [UIView transitionWithView:self.imageView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        UIImage *currentImage = self.imageView.image;
        NSUInteger index = [self.images indexOfObject:currentImage];
        index = (index + 1) % self.images.count;
        self.imageView.image = self.images[index];
    } completion:nil];
}

- (IBAction)switchImage:(id)sender {
    [self useUIKit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
