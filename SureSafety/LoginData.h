//
//  Data.h
//  SureSafety
//
//  Created by Xcode User on 2017-11-14.
//  Copyright © 2017 Xcode User. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginData : NSObject
{
    NSString *username;
    NSString *password;
    
    
}

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
-(id)initWithData:(NSString *)u thePassword:(NSString*)p;
@end
