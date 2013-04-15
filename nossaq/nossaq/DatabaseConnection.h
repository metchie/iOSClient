//
//  DatabaseConnection.h
//  nossaq
//
//  Created by Aykut on 4/1/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface DatabaseConnection : NSObject{
}

+(DatabaseConnection*) sharedInstance;
+(BOOL)addAccountUsername:(NSString *) accountString password:(NSString *) passwordString email:(NSString *) emailString name: (NSString *) nameString surname: (NSString *) surnameString;
+(BOOL)checkAccountUserName:(NSString *) accountString password:(NSString *) passwordString;
@end
