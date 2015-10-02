//
//  ViewController.m
//  RichText
//
//  Created by lzw on 15/9/27.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *labelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.labelView.bounds;
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.labelView.layer addSublayer:textLayer];
    
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    NSString *text = @"Lorem ipsum dolor sit amet, consectetur adipiscing \
    elit. Quisque massa arcu, eleifend vel varius in, facilisis pulvinar \
    leo. Nunc quis nunc at mauris pharetra condimentum ut ac neque. Nunc \
    elementum, libero ut porttitor dictum, diam odio congue lacus, vel \
    fringilla sapien diam at purus. Etiam suscipit pretium nunc sit amet \
    lobortis";
    
    UIFont *font = [UIFont systemFontOfSize:15];
    NSMutableAttributedString *string = nil;
    string = [[NSMutableAttributedString alloc] initWithString:text];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFloat fontSize = font.pointSize;
    CTFontRef fontRef = CTFontCreateWithName(fontName, fontSize, NULL);
    
    NSDictionary *attrs = @{
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor blackColor].CGColor,
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)fontRef};
    [string setAttributes:attrs range:NSMakeRange(0, text.length)];

    attrs = @{
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)[UIColor redColor].CGColor,
        (__bridge id)kCTForegroundColorAttributeName: (__bridge id)fontRef,
        (__bridge id)kCTUnderlineStyleAttributeName: @(kCTUnderlineStyleSingle)};
    [string setAttributes:attrs range:NSMakeRange(6, 5)];
    
    CFRelease(fontRef);
    
    textLayer.string = string;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
