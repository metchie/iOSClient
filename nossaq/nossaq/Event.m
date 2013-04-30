//
//  Event.m
//  nossaq
//
//  Created by Aykut on 4/24/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "Event.h"

@implementation Event
@synthesize startDate;
@synthesize endDate;
@synthesize type;
@synthesize title;
@synthesize notes;


int const MANUAL_EVENT = 0;
int const AUTO_EVENT = 1;

@end
