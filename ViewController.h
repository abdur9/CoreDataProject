//
//  ViewController.h
//  simpleExample
//
//  Created by Abdur Rahim on 30/03/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  void(^ webviewCompletion)(time_t time_taken);

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property(nonatomic,strong)NSDate *timer;
@property (strong,nonatomic)webviewCompletion completion;

@end

