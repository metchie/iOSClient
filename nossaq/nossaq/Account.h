//
//  Account.h
//  nossaq
//
//  Created by Aykut on 4/24/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *surname;
@property (strong, nonatomic) NSString *email;

@end
