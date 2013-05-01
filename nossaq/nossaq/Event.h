//
//  Event.h
//  nossaq
//
//  Created by Aykut on 4/24/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (assign) int type; // 0 Manual 1 Auto
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *notes;

extern int const MANUAL_EVENT;
extern int const AUTO_EVENT;

@end
