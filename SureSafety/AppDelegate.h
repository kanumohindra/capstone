//
//  AppDelegate.h
//  SureSafety
//
//  Created by Xcode User on 2017-10-10.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginData.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *people;
}
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *people;
-(void)readDataFromDatabase;
-(BOOL)insertIntoDatabase:(LoginData *)person;


@end

