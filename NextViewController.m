//
//  NextViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 31/03/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "NextViewController.h"
#import "ViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)showWebViewPressed:(id)sender{
    ViewController *viewControl=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"viewcontrol"];
    [viewControl setCompletion:^(time_t timetaken){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Finish" message:[NSString stringWithFormat:@"%.5ld",timetaken] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }];
//    [self presentViewController:viewControl animated:NO completion:nil];
    [self.navigationController pushViewController:viewControl animated:NO];    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
