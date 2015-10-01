//
//  ViewController.m
//  CAEAGLLayer
//
//  Created by lzw on 15/10/1.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import "ViewController.h"
#import <GLKit/GLKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *glView;
@property (nonatomic, strong) EAGLContext *glContext;
@property (nonatomic, strong) CAEAGLLayer *glLayer;
@property (nonatomic, strong) GLKBaseEffect *effect;
@property (nonatomic, assign) GLuint frameBuffer;
@property (nonatomic, assign) GLuint colorRenderBuffer;
@property (nonatomic, assign) GLint frameBufferWidth;
@property (nonatomic, assign) GLint frameBufferHeight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:self.glContext];
    
    self.glLayer = [CAEAGLLayer layer];
    self.glLayer.frame = self.glView.bounds;
    [self.glView.layer addSublayer:self.glLayer];
    
    self.glLayer.drawableProperties = @{kEAGLDrawablePropertyRetainedBacking: @NO,
                                        kEAGLDrawablePropertyColorFormat:kEAGLColorFormatRGBA8};
    self.effect = [[GLKBaseEffect alloc] init];
    
    [self setUpBuffers];
    
    [self drawFrame];
}

- (void)setUpBuffers {
    glGenFramebuffers(1, &_frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);
    
    glGenRenderbuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
    [self.glContext renderbufferStorage:GL_RENDERBUFFER fromDrawable:self.glLayer];
    
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &_frameBufferWidth);
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &_frameBufferHeight);
    
    if (glCheckFramebufferStatus(GL_FRAMEBUFFER) != GL_FRAMEBUFFER_COMPLETE) {
        NSLog(@"Failed to make complete framebuffer object: %i", glCheckFramebufferStatus(GL_FRAMEBUFFER));
    }
    
}

- (void)drawFrame {
    glBindFramebuffer(GL_FRAMEBUFFER, _frameBuffer);
    glViewport(0, 0, _frameBufferWidth, _frameBufferHeight);
    
    [self.effect prepareToDraw];
    
    GLfloat vertices[] = {
        -0.5f, -0.5f, -1.0f,
        0.0f, 0.5f, -1.0f,
        0.5f, -0.5f, -1.0f
    };
    
    GLfloat colors[] = {
        0.0f, 0.0f, 1.0f, 1.0f,
        0.0f, 1.0f, 0.0f, 1.0f,
        1.0f, 0.0f, 0.0f, 1.0f,
    };
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 0, vertices);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, colors);
    
    glDrawArrays(GL_TRIANGLES, 0, 3);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    
    [self.glContext presentRenderbuffer:GL_RENDERBUFFER];
}

- (void)tearDownBuffers {
    if (_frameBuffer) {
        glDeleteFramebuffers(1, &_frameBuffer);
        _frameBuffer = 0;
    }
    
    if (_colorRenderBuffer) {
        glDeleteFramebuffers(1, &_colorRenderBuffer);
        _colorRenderBuffer = 0;
    }
}

- (void)dealloc {
    [self tearDownBuffers];
    [EAGLContext setCurrentContext:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
