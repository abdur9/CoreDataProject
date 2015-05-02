//
//  coreTextView.m
//  simpleExample
//
//  Created by Abdur Rahim on 28/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//
#define DEGREES_TO_RADIANS(angle) ((angle) / 180.0 * M_PI)
#import "coreTextView.h"
#import <CoreText/CoreText.h>
@implementation coreTextView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"This is called");
    
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds );
    
   NSDictionary *attrs = @{ NSForegroundColorAttributeName : [UIColor redColor] };
    
    NSAttributedString* attString = [[NSAttributedString alloc]
                                      initWithString:@"Hello core text world!" attributes:attrs] ; //2
    
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString); //3
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
//    CGContextRotateCTM(context, DEGREES_TO_RADIANS(90));
    
    // Flip the coordinate system
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height-200);
//    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFrameDraw(frame, context); //4
    
    CFRelease(frame); //5
    CFRelease(path);
    CFRelease(framesetter);
}


@end
