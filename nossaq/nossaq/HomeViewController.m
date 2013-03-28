//
//  HomeViewController.m
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //initialize calendar month view
	self.monthCalendarView=[[TKCalendarMonthView alloc] init];
    [self.monthCalendarView selectDate:[NSDate date]];
    [self.calenderView addSubview:self.monthCalendarView];
    
    //initialize calender month view list
    self.monthCalendarTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.calenderView insertSubview:self.monthCalendarTableView belowSubview:self.monthCalendarView];
    
    //initialize list view (hidden default)
     self.listView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.calenderView addSubview:self.listView];
    self.listView.hidden = YES;
    
    //initialize month view (hidden default)
    self.dayCalendarView=[[TKCalendarDayView alloc] initWithFrame:self.view.bounds];
    [self.calenderView addSubview:self.dayCalendarView];
    self.dayCalendarView.hidden= YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signoutButton:(id)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* mainViewController = [mainStoryboard instantiateInitialViewController];
    
    mainViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:mainViewController animated:YES completion:NULL];
}

- (IBAction)todayButton:(id)sender {
    [self.monthCalendarView selectDate: [NSDate date]];
}

- (IBAction)calendarViewSelectionButton:(id)sender {
    
     UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    
    if ([segmentedControl selectedSegmentIndex] == 0) {
        //Set list view visible and other views gone
        self.listView.hidden = NO;
        self.monthCalendarView.hidden = YES;
        self.monthCalendarTableView.hidden = YES;
        self.dayCalendarView.hidden = YES;
    }
    else if ([sender selectedSegmentIndex] == 1) {
        //Set month view visible and other views gone
        self.listView.hidden = YES;
        self.monthCalendarView.hidden = NO;
        self.monthCalendarTableView.hidden = NO;
        self.dayCalendarView.hidden = YES;
    }
    else if ([sender selectedSegmentIndex] == 2) {
        //Set day view visible and other views gone
        self.listView.hidden = YES;
        self.monthCalendarView.hidden = YES;
        self.monthCalendarTableView.hidden = YES;
        self.dayCalendarView.hidden = NO;
    }
}

@end
