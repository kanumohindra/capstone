//
//  Data.m
//  SureSafety
//
//  Created by Xcode User on 2017-11-14.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import "LoginData.h"

@implementation LoginData
@synthesize username, password;
-(id)initWithData:(NSString *)u thePassword:(NSString *)p
{
    if(self = [super init])
    {
        [self setUsername:u];
        [self setPassword:p];
    }
    return self;
}
@end
