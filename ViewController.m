//
//  ViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 30/03/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "ViewController.h"
#import "SqliteExampleViewController.h"
#import "coreTextViewController.h"
#import "imageEffectViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_webview setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
}

- (IBAction)loadClicked:(id)sender {
    _timer=[NSDate date];
    NSURL *url=[NSURL URLWithString:@"http://auc.edu.au"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    [_webview loadRequest:request];
    
}
- (IBAction)doneClicked:(id)sender {
    
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self completion]([[self timer]timeIntervalSinceNow]);
}

- (IBAction)openSQLite:(id)sender {
     SqliteExampleViewController *view000=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"sqlitesampleee"];
    [self.navigationController pushViewController:view000 animated:NO];
//    [self presentViewController:viewControl animated:NO completion:nil];
}
- (IBAction)graphicsView:(id)sender {
    SqliteExampleViewController *view001=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"graphicsControl"];//@"graphicsViewController"
    [self.navigationController pushViewController:view001 animated:NO];
    
}

- (IBAction)goToCoreText:(id)sender {
    coreTextViewController *view001=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"coreText"];//@"graphicsViewController"
    [self.navigationController pushViewController:view001 animated:NO];
}
- (IBAction)gotoImage:(id)sender {
    imageEffectViewController *imageEffect=[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"imageEffect"];//@"graphicsViewController"
    [self.navigationController pushViewController:imageEffect animated:NO];
}

@end
