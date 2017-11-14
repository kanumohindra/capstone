//
//  AppDelegate.m
//  SureSafety
//
//  Created by Xcode User on 2017-10-10.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize databaseName, databasePath, people;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.people = [NSMutableArray array];
    self.databaseName = @"SureSafety.db";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    [self readDataFromDatabase];
    
    return YES;
}

-(BOOL)insertIntoDatabase:(LoginData *)person
{
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into Login values(?, ?);";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(compiledStatement, 1, [person.username UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [person.password UTF8String], -1, SQLITE_TRANSIENT);
        }
        else
        {
            returnCode = NO;
        }
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE)
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            returnCode = NO;
        }
        else
        {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    else
    {
        returnCode = NO;
    }
    
    sqlite3_close(database);
    return returnCode;
}

-(void)readDataFromDatabase
{
    [self.people removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "select * from Login;";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                char *u = (char *)sqlite3_column_text(compiledStatement, 1);
                NSString *username = [NSString stringWithUTF8String:u];
                
                char *p = (char *)sqlite3_column_text(compiledStatement, 2);
                NSString *password = [NSString stringWithUTF8String:p];
                
                LoginData *data = [[LoginData alloc] initWithData:username thePassword:password];
                [self.people addObject:data];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

-(void)checkAndCreateDatabase
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
    
    return;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
