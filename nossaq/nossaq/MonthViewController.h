//
//  HomeViewController.h
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>

@interface MonthViewController : TKCalendarMonthTableViewController
- (IBAction)signoutButton:(id)sender;

@property (strong, nonatomic) UITableView *listView;

@property (strong, nonatomic) TKCalendarDayView *dayCalendarView;

@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) NSMutableDictionary *dataDictionary;

@property (weak, nonatomic) IBOutlet UISegmentedControl *viewModeSelectionButton;
- (void) fetchDatesStartDate:(NSDate*)start endDate:(NSDate*)end;
@end
