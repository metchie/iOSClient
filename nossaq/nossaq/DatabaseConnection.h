//
//  DatabaseConnection.h
//  nossaq
//
//  Created by Aykut on 4/1/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Account.h"
#import "Calendar.h"
#import "Event.h"
@interface DatabaseConnection : NSObject{
}

+(DatabaseConnection*) sharedInstance;
+(BOOL)addAccount: (Account *)account;
+(BOOL)checkAccountUserName:(NSString *) accountString password:(NSString *) passwordString;
+(BOOL)addEvent: (Event *)event;
+(NSArray *) fetchEventsBetweenStartDate:(NSDate *)startDate endDate:(NSDate *)endDate;
+(NSArray *) fetchAllEvents;
+(NSArray *) fetchEventsOnDate:(NSDate *)date;
+(BOOL) updateExistingEvent:(Event *)existingEvent withNewEvent: (Event *)newEvent;

@end
