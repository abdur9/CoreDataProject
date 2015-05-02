//
//  Notificatio2inViewController.h
//  simpleExample
//
//  Created by Abdur Rahim on 06/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Notificatio2inViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *mySwitch;

@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
- (IBAction)dismiss:(id)sender;
@end
