//
//  main.m
//  TileCutter
//
//  Created by lzw on 15/9/30.
//  Copyright © 2015年 微信:  lzwjava. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if (argc < 2) {
            NSLog(@"TileCutter arguments: inputfile");
            return 0;
        }
        
        NSString *inputFile = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        CGFloat tileSize = 256;
        NSString *outputPath = [inputFile stringByDeletingPathExtension];
        NSImage *image = [[NSImage alloc] initWithContentsOfFile:inputFile];
        NSSize size = [image size];
        NSArray *representations = [image representations];
        if ([representations count]) {
            NSBitmapImageRep *representation = representations[0];
            size.width = [representation pixelsWide];
            size.height = [representation pixelsHigh];
        }
        NSRect rect = NSMakeRect(0, 0, size.width, size.height);
        CGImageRef imageRef = [image CGImageForProposedRect:&rect context:NULL hints:nil];
        NSInteger rows = ceil(size.width / tileSize);
        NSInteger cols = ceil(size.height / tileSize);
        
        for (int y = 0; y < rows; y++) {
            for (int x = 0; x < cols; x++) {
                CGRect tileRect = CGRectMake(x * tileSize, y * tileSize , tileSize, tileSize);
                CGImageRef tileImage = CGImageCreateWithImageInRect(imageRef, tileRect);
                NSBitmapImageRep *imageRep = [[NSBitmapImageRep alloc] initWithCGImage:tileImage];
                NSData *data = [imageRep representationUsingType:NSJPEGFileType properties:@{}];
                CGImageRelease(tileImage);
                NSString *path = [outputPath stringByAppendingFormat:@"_%02i_%02i.jpg", x, y];
                [data writeToFile:path atomically:NO];
            }
        }
    }
    return 0;
}
