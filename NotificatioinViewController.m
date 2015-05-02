//
//  NotificatioinViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 06/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "NotificatioinViewController.h"
#import "Notificatio2inViewController.h"

@interface NotificatioinViewController ()
{
    int count;
}
@end

@implementation NotificatioinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showCount) name:@"toogled" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gotoScreenTwo:(id)sender {
    Notificatio2inViewController *notify=[self.storyboard instantiateViewControllerWithIdentifier:@"notofic2"];
    [self.navigationController pushViewController:notify animated:NO];
}
-(void)showCount{
    ++count;
    self.displayLabel.text=[NSString stringWithFormat:@"%d",count];
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"toogled" object:nil];
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
