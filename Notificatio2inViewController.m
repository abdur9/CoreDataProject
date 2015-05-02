//
//  Notificatio2inViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 06/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "Notificatio2inViewController.h"

@interface Notificatio2inViewController ()

@end

@implementation Notificatio2inViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
     }
- (IBAction)mySwitch:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"toogled" object:nil];
    
}
@end
