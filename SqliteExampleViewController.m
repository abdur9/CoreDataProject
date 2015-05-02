//
//  SqliteExampleViewController.m
//  simpleExample
//
//  Created by Abdur Rahim on 03/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#import "SqliteExampleViewController.h"
#import "NotificatioinViewController.h"
@interface SqliteExampleViewController ()

@end

@implementation SqliteExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *docsDir;
    NSArray *dirPaths;
    
    //get the directory
    dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir=dirPaths[0];
    
    
    //Build the path to keep the database
    _databasePath=[[NSString alloc]initWithString:[docsDir stringByAppendingPathComponent:@"myUserDB.sqlite"]];
    
    NSFileManager *fileMgr=[NSFileManager defaultManager];
    if([fileMgr fileExistsAtPath:_databasePath]==NO) {
        const char *dbpath=[_databasePath UTF8String];
        if(sqlite3_open(dbpath, &_db)==SQLITE_OK){
            char *errorMessage;
            const char *sql_StateMent="CREATE TABLE IF NOT EXISTS users(ID INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT,address TEXT,phone TEXT)";
            if(sqlite3_exec(_db, sql_StateMent,NULL,NULL,&errorMessage )!=SQLITE_OK){
                [self showUIAlertWithMessage:@"Failed to create the table" andTitle:@"Error"];
            }
            sqlite3_close(_db);
            
        }
        else{
            [self showUIAlertWithMessage:@"Failed to open or create the table" andTitle:@"Error"];
        }
    }
    
    
}
-(void)showUIAlertWithMessage:(NSString *)message andTitle:(NSString *)title{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
    
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

- (IBAction)save:(id)sender {
    sqlite3_stmt *statement;
    const char *dbpath=[_databasePath UTF8String];
    if(sqlite3_open(dbpath, &_db)== SQLITE_OK){
        NSString *sql=[NSString stringWithFormat:@"INSERT INTO users (name,address,phone) values (\"%@\",\"%@\",\"%@\" )",_name.text,_address.text,_phone.text];
        const char *insert_statement=[sql UTF8String];
        sqlite3_prepare_v2(_db, insert_statement, -1, &statement, NULL);
        if(sqlite3_step(statement)==SQLITE_DONE){
            [self showUIAlertWithMessage:@"user added to the database "andTitle:@"message"];
            _name.text=@"";
            _address.text=@"";
            _phone.text=@"";
        }
        else{
            [self showUIAlertWithMessage:@"Failed to add the user" andTitle:@"error"];
        }
        sqlite3_finalize(statement);
        sqlite3_close(_db);
    }
    
    
}

- (IBAction)find:(id)sender {
    sqlite3_stmt *statement;
    const char *dbpath=[_databasePath UTF8String];
    if(sqlite3_open(dbpath, &_db)== SQLITE_OK){
        NSString *sql=[NSString stringWithFormat:@"SELECT address,phone FROM users WHERE name = \"%@\"",_name.text];
        const char *query_Statement=[sql UTF8String];
        if(sqlite3_prepare_v2(_db, query_Statement, -1, &statement, NULL) == SQLITE_OK){
            if(sqlite3_step(statement)==SQLITE_ROW){
                NSString *addressField=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                _address.text=addressField;
                NSString *aphoneField=[[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 1)];
                _phone.text=aphoneField;
                [self showUIAlertWithMessage:@"match found in database" andTitle:@"message"];
                
            }
            else{
                [self showUIAlertWithMessage:@"match not found in databasr" andTitle:@"message"];
                _address.text=@"";
                _phone.text=@"";
            }
            sqlite3_finalize(statement);
        }
        }
        else{
            [self showUIAlertWithMessage:@"Failed to search database" andTitle:@"Error"];
        }
    
    
}

- (IBAction)delete:(id)sender {
const char *dbpath=[_databasePath UTF8String];
    char *errroMessage;
    if(sqlite3_open(dbpath, &_db)== SQLITE_OK){
        NSString *querySQL=[NSString stringWithFormat:@"DELETE FROM users WHERE name=\"%@\"",_name.text];
        const char *QUERY_STATEMENT=[querySQL UTF8String];
        
    
    if(sqlite3_exec(_db, QUERY_STATEMENT, NULL, NULL, &errroMessage)==SQLITE_OK){
        [self showUIAlertWithMessage:@"Deleted from database" andTitle:@"Message"];
    }
    else{
        [self showUIAlertWithMessage:@"Failed to delete from database" andTitle:@"Error"];
    }
    }

    else{
        [self showUIAlertWithMessage:@"Failed to delete from database" andTitle:@"error"];
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    if([_phone isFirstResponder]&&[touch view]!=_phone){
        [_phone resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}
- (IBAction)notific1:(id)sender {
    NotificatioinViewController *notify=[self.storyboard instantiateViewControllerWithIdentifier:@"notific1"];
    [self.navigationController pushViewController:notify animated:NO];
    
}

@end
