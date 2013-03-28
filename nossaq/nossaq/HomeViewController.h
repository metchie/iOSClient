//
//  HomeViewController.h
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *calenderView;
- (IBAction)signoutButton:(id)sender;
- (IBAction)todayButton:(id)sender;
- (IBAction)calendarViewSelectionButton:(id)sender;

@property (strong, nonatomic) UITableView *listView;

@property (strong, nonatomic) TKCalendarMonthView *monthCalendarView;
@property (strong, nonatomic) UITableView *monthCalendarTableView;

@property (strong, nonatomic) TKCalendarDayView *dayCalendarView;
@end
