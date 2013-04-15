//
//  Connection.h
//  nossaq
//
//  Created by Aykut on 3/30/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerConnection : NSObject {
    // Instance variables:
    //   - Declare as usual.  The alloc/sharedIntance.}

// Properties as usual
}

// Required: A method to retrieve the shared instance
+(ServerConnection*) sharedInstance;


// Shared Public Methods:
//   - Using static methods for opertations is a nice convenience
//   - Each method should ensure it is using the above sharedInstance
+(NSString *) getDataWithGETConnection: (NSString*)methodName MethodName: (NSString*)methodName Paramater: (NSMutableArray*)parameter;
+(NSString *) sendXMLWithPOSTConnection;

// Instance Methods: Declare and implement as usual
@end

