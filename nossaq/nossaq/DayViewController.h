//
//  DayViewController.h
//  nossaq
//
//  Created by Aykut on 4/29/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <TapkuLibrary/TapkuLibrary.h>
#import <UIKit/UIKit.h>

@interface DayViewController : TKCalendarDayViewController

@property (nonatomic,strong) NSArray *data;

- (IBAction)modeSelectionButton:(id)sender;
- (IBAction)signout:(id)sender;

@end
