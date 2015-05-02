//
//  SqliteExampleViewController.h
//  simpleExample
//
//  Created by Abdur Rahim on 03/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface SqliteExampleViewController : UIViewController

@property(strong,nonatomic)NSString *databasePath;
@property(nonatomic)sqlite3 *db;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *address;
@property (weak, nonatomic) IBOutlet UITextField *phone;

- (IBAction)save:(id)sender;
- (IBAction)find:(id)sender;
- (IBAction)delete:(id)sender;


@end
