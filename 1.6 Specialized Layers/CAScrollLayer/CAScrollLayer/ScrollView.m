//
//  ScrollView.m
//  CAScrollLayer
//
//  Created by lzw on 15/9/29.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ScrollView.h"

@implementation ScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (Class)layerClass {
    return [CAScrollLayer class];
}

- (void)setUp {
    self.layer.masksToBounds = YES;
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {
    return [self setUp];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    CGPoint offset = self.bounds.origin;
    CGPoint translation = [recognizer translationInView:self];
    offset.x -= translation.x;
    offset.y -= translation.y;
    
    NSLog(@"translation: %@",NSStringFromCGPoint(translation));
    
    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    
    [recognizer setTranslation:CGPointZero inView:self];
}


@end
