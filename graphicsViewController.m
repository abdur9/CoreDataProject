//
//  graphicsViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 14/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "graphicsViewController.h"

@implementation graphicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0,100, 200, 50)];
    label.text=@"======================";
    [self.view addSubview:label];
    volume=40.0;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    CGPoint center=self.view.center;
    
    [bezierPath addArcWithCenter:center radius:50 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:bezierPath.CGPath];
    [progressLayer setStrokeColor:[UIColor colorWithWhite:0.3 alpha:0.2].CGColor];
    [progressLayer setFillColor:[UIColor greenColor].CGColor];
    [progressLayer setLineWidth:0.3 * self.view.bounds.size.width];
    [progressLayer setStrokeEnd:0/100];
    [self.view.layer addSublayer:progressLayer];
    [CATransaction begin];
    CABasicAnimation *animateStrokeDown = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animateStrokeDown.toValue = [NSNumber numberWithFloat:100/100.];
    animateStrokeDown.duration = 5.0;
    [progressLayer addAnimation:animateStrokeDown forKey:@"animateStrokeDown"];
    [CATransaction commit];
    
    
//    UIBezierPath *trackPath = [UIBezierPath bezierPath];
//    [trackPath moveToPoint:CGPointMake(self.view.center.x, self.view.center.y)];
//    [trackPath moveToPoint:CGPointMake(30, 40)];
//    // ... Path drawing operations ...
//    CAShapeLayer *racetrack = [CAShapeLayer layer];
//    racetrack.path = trackPath.CGPath;
//    racetrack.strokeColor = [UIColor greenColor].CGColor;
//    racetrack.fillColor = [UIColor yellowColor].CGColor;
//    racetrack.lineWidth = 30.0;
//    [self.view.layer addSublayer:racetrack];
//    CAShapeLayer *centerline = [CAShapeLayer layer];
//    centerline.path = trackPath.CGPath;
//    centerline.strokeColor = [UIColor greenColor].CGColor;
//    centerline.fillColor = [UIColor redColor].CGColor;
//    centerline.lineWidth = 2.0;
//    centerline.lineDashPattern = [NSArray arrayWithObjects:
//                                  [NSNumber numberWithInt:6],
//                                  [NSNumber numberWithInt:2],
//                                  nil];
//    [self.view.layer addSublayer:centerline];
//    
//    CALayer *car = [CALayer layer];
//    car.bounds = CGRectMake(self.view.center.x, self.view.center.y, 44.0, 20.0);
//    car.position = CGPointMake(self.view.center.x, self.view.center.y);
//    car.contents = (id)([UIImage imageNamed:@"carmodel"].CGImage);
//    [self.view.layer addSublayer:car];
//    
//    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    anim.path = trackPath.CGPath;
//    anim.rotationMode = kCAAnimationRotateAuto;
//    anim.repeatCount = HUGE_VALF;
//    anim.duration = 8.0;
//    [car addAnimation:anim forKey:@"race"];
}
-(void)animate{
    UIBezierPath *trackPath = [UIBezierPath bezierPath];
    [trackPath moveToPoint:CGPointMake(160, 125)];
    // ... Path drawing operations ...
    CAShapeLayer *racetrack = [CAShapeLayer layer];
    racetrack.path = trackPath.CGPath;
    racetrack.strokeColor = [UIColor blackColor].CGColor;
    racetrack.fillColor = [UIColor yellowColor].CGColor;
    racetrack.lineWidth = 30.0;
    [self.view.layer addSublayer:racetrack];
    CAShapeLayer *centerline = [CAShapeLayer layer];
    centerline.path = trackPath.CGPath;
    centerline.strokeColor = [UIColor greenColor].CGColor;
    centerline.fillColor = [UIColor redColor].CGColor;
    centerline.lineWidth = 2.0;
    centerline.lineDashPattern = [NSArray arrayWithObjects:
                                  [NSNumber numberWithInt:6],
                                  [NSNumber numberWithInt:2],
                                  nil];
    [self.view.layer addSublayer:centerline];
    
    CALayer *car = [CALayer layer];
    car.bounds = CGRectMake(0, 0, 44.0, 20.0);
    car.position = CGPointMake(160, 25);
    car.contents = (id)([UIImage imageNamed:@"carmodel"].CGImage);
    [self.view.layer addSublayer:car];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anim.path = trackPath.CGPath;
    anim.rotationMode = kCAAnimationRotateAuto;
    anim.repeatCount = HUGE_VALF;
    anim.duration = 8.0;
    [car addAnimation:anim forKey:@"race"];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
