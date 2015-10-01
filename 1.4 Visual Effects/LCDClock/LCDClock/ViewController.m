//
//  ViewController.m
//  LCDClock
//
//  Created by lzw on 15/9/23.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *digitViews;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *digits = [UIImage imageNamed:@"Digits"];
    
    for (UIView *view in self.digitViews) {
        view.layer.contents = (__bridge id)digits.CGImage;
        view.layer.contentsRect = CGRectMake(0, 0, 0.1, 1.0);
        view.layer.contentsGravity = kCAGravityResizeAspect;
        view.layer.backgroundColor = [UIColor clearColor].CGColor;
        view.layer.magnificationFilter = kCAFilterNearest;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self tick];
}

- (void)setDigit:(NSInteger)digit forView:(UIView *)view {
    view.layer.contentsRect = CGRectMake(digit * 0.1, 0, 0.1, 1);
}

- (void)tick {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger units = NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *compoents = [calendar components:units fromDate:[NSDate date]];
    [self setDigit:compoents.hour / 10 forView:self.digitViews[0]];
    [self setDigit:compoents.hour % 10 forView:self.digitViews[1]];
    
    [self setDigit:compoents.minute / 10 forView:self.digitViews[2]];
    [self setDigit:compoents.minute % 10 forView:self.digitViews[3]];
    
    [self setDigit:compoents.second / 10 forView:self.digitViews[4]];
    [self setDigit:compoents.second %10 forView:self.digitViews[5]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
