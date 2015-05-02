//
//  imageEffectViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 27/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "imageEffectViewController.h"

@interface imageEffectViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *Image;

@end

@implementation imageEffectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Image.image=[UIImage imageNamed:@"redchillie"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)sepiaEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        @"inputIntensity", @0.8, nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
   CGImageRelease(cgimg);
}
- (IBAction)secondEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter =[CIFilter filterWithName:@"CIColorControls" withInputParameters:@{
        @"inputImage": beginImage,
        @"inputSaturation" : @0.2,
        @"inputBrightness" : @0.2,
        @"inputContrast"   : @0.3
    }];
//    CIFilter filterWithName:@"CIColorControls"
//                                  withInputParameters:{
//                        @"inputImage", beginImage,
//                        @"inputSaturation" : @0.5,
//                        @"inputBrightness" : @1.2,
//                        @"inputContrast"   : @1.3
//                                  }];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
- (IBAction)thirdEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGloom"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        kCIInputRadiusKey, @100.0f,
                        kCIInputIntensityKey, @0.75f,
                        nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
- (IBAction)fourthEffect:(id)sender {
    
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIBumpDistortion"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        kCIInputCenterKey, [CIVector vectorWithX:200 Y:150],
                        kCIInputScaleKey, @3.0f,
                        nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
    
}
- (IBAction)fifthEffect:(id)sender {
 _Image.image=[UIImage imageNamed:@"redchillie"];
}

- (IBAction)sixthEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CITwirlDistortion"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        kCIInputCenterKey, [CIVector vectorWithX:150 Y:150],
                        kCIInputAngleKey, @3.0f,
                        nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
- (IBAction)seventhEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CICircularScreen"
                                  keysAndValues: kCIInputImageKey, beginImage,
                        kCIInputCenterKey, [CIVector vectorWithX:150 Y:150],
                        kCIInputWidthKey, @6.0f,
                        kCIInputSharpnessKey, @0.70f,
                        nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
- (IBAction)eigthEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter = [CIFilter filterWithName:@"CISharpenLuminance"
                        keysAndValues: kCIInputImageKey, beginImage,
                        kCIInputSharpnessKey, @1.00f,
                        nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
- (IBAction)ninthEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
//    const CGFloat weights[] = { 1, 0, -1,
//        2, 0, -2,
//        1, 0, -1};
    CIFilter *filter =  [CIFilter filterWithName:@"CIColorPolynomial" keysAndValues:
                         @"inputImage", beginImage,
                         @"inputRedCoefficients", [CIVector vectorWithX:1.0 Y:-4.0 Z:4.0 W:0.0],
                         @"inputGreenCoefficients", [CIVector vectorWithX:1.0 Y:-4.0 Z:4.0 W:0.0],
                         @"inputBlueCoefficients", [CIVector vectorWithX:1.0 Y:-4.0 Z:4.0 W:0.0],
                         nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
  
}
- (IBAction)tenthEffect:(id)sender {
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];

    CIFilter *filter =  [CIFilter filterWithName:@"CITriangleTile" keysAndValues:
                         kCIInputImageKey, beginImage,
                         kCIInputCenterKey, [CIVector vectorWithX:150 Y:150],
                         kCIInputAngleKey, @1.0f,
                         kCIInputWidthKey, @50.0f,
                         nil];
    CIImage *outImage = [filter outputImage];

    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
//    _Image.image=[UIImage imageWithCIImage:outputImage1];
}

-(IBAction)eleventhEffect:(id)sender{
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter =  [CIFilter filterWithName:@"CIAccordionFoldTransition" keysAndValues:
                         kCIInputImageKey,[[CIImage alloc]initWithImage:[UIImage imageNamed:@"image"]] ,
                         kCIInputTargetImageKey, beginImage,
                         @"inputNumberOfFolds", @15,
                         @"inputFoldShadowAmount", @1.0f,
                         @"inputTime", @0.50f,
                         nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
-(IBAction)twelvethEffect:(id)sender{
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter =  [CIFilter filterWithName:@"CIBarsSwipeTransition" keysAndValues:
                         kCIInputImageKey,[[CIImage alloc]initWithImage:[UIImage imageNamed:@"image"]] ,
                         kCIInputTargetImageKey, beginImage,
                         @"inputAngle", @3.14,
                         @"inputWidth", @30.00f,
                         @"inputBarOffset", @10.00f,
                         @"inputTime", @0.5,
                         nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
-(IBAction)thirteenthEffect:(id)sender{
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    const CGFloat weights[]={0, 0 ,300 ,300
    };
    CIFilter *filter =  [CIFilter filterWithName:@"CIPageCurlTransition" keysAndValues:
                         kCIInputImageKey,[[CIImage alloc]initWithImage:[UIImage imageNamed:@"image"]] ,
                         kCIInputTargetImageKey, beginImage,
                         kCIAttributeTypeRectangle, [CIVector vectorWithValues:weights count:4 ],
                         kCIAttributeTypeDistance, @100.00f,
                         @"inputShadingImage", [[CIImage alloc]initWithImage:[UIImage imageNamed:@"Shading"]],
                         nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
-(IBAction)fourteenthEffect:(id)sender{
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    
    CIFilter *filter =  [CIFilter filterWithName:@"CIBarsSwipeTransition" keysAndValues:
                         kCIInputImageKey,[[CIImage alloc]initWithImage:[UIImage imageNamed:@"image"]] ,
                         kCIInputTargetImageKey, beginImage,
                         @"inputAngle", @3.14,
                         @"inputWidth", @30.00f,
                         @"inputBarOffset", @10.00f,
                         @"inputTime", @0.5,
                         nil];
    CIImage *outImage = [filter outputImage];
    
    CGImageRef cgimg=[context createCGImage:outImage fromRect:[outImage extent]];
    
    
    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    CGImageRelease(cgimg);
}
-(void)effectMustKnow{
    CIImage *beginImage =[[CIImage alloc]initWithImage:_Image.image];
    
    CIContext * context=[CIContext contextWithOptions:nil];
    //        const CGFloat weights[] = {
    //            1, 0, -1,
    //            2, 0, -2,
    //            1, 0, -1
    //        };
    const CGFloat weights[] = {
        1*1, 0*1, -1*1,
        0, 0, 0,
        1*1, 0*1, -1*1
    };
    //    CIFilter *filter =  [CIFilter filterWithName:@"CIConvolution3X3" keysAndValues:
    //                         @"inputImage", beginImage,
    //                         @"inputWeights", [CIVector vectorWithValues:weights count:9],
    //                         @"inputBias", @1.0f,
    //                         nil];
    //    CIImage *outImage = [filter outputImage];
    //    CIImage *outputImage1=[CIFilter filterWithName:@"CIConvolution3X3" keysAndValues:
    //                           @"inputImage", beginImage,
    //                           @"inputWeights", [CIVector vectorWithValues:weights count:9],
    //                           @"inputBias", @1.0f,
    //                           nil].outputImage;
    //
    CIImage *outputImage1 = [CIFilter filterWithName:@"CIConvolution3X3" keysAndValues:
                             @"inputImage", beginImage,
                             @"inputWeights", [CIVector vectorWithValues:weights count:9],
                             @"inputBias", @0.5,
                             nil].outputImage;
    //    CGImageRef cgimg=[context createCGImage:outputImage1/*outImage*/ fromRect:[outputImage1 /*outImage*/ extent]];
    
    
    //    [_Image setImage:[UIImage imageWithCGImage:cgimg]];
    //    CGImageRelease(cgimg);
    _Image.image=[UIImage imageWithCIImage:outputImage1];
}
@end
