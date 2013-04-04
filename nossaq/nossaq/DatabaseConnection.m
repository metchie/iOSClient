//
//  DatabaseConnection.m
//  nossaq
//
//  Created by Aykut on 4/1/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "DatabaseConnection.h"

@implementation DatabaseConnection

#pragma mark Singleton Implementation
static DatabaseConnection *sharedObject;

+ (DatabaseConnection*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}

#pragma mark Shared Public Methods

+(BOOL)addAccountUsername:(NSString *) accountString password:(NSString *) passwordString email:(NSString *) emailString name: (NSString *) nameString surname: (NSString *) surnameString{
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Account"
                  inManagedObjectContext:context];
    [newContact setValue:accountString forKey:@"username" ];
    [newContact setValue:passwordString forKey:@"acpass"];
    [newContact setValue:emailString forKey:@"email"];
    [newContact setValue:nameString forKey:@"name" ];
    [newContact setValue:surnameString forKey:@"surname"];
  
    NSError *error;
    return [context save:&error]; // YES if the save succeeds, otherwise NO. 
}

+(BOOL)getAccountUserName:(NSString *) accountString password:(NSString *) passwordString{
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Account"
                  inManagedObjectContext:context];
    [newContact setValue:accountString forKey:@"username" ];
    [newContact setValue:passwordString forKey:@"acpass"];
    [newContact setValue:emailString forKey:@"email"];
    [newContact setValue:nameString forKey:@"name" ];
    [newContact setValue:surnameString forKey:@"surname"];
    
    NSError *error;
    return [context save:&error]; // YES if the save succeeds, otherwise NO.
}
@end
