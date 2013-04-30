//
//  DayViewController.m
//  nossaq
//
//  Created by Aykut on 4/29/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "DayViewController.h"

@interface DayViewController ()

@end

@implementation DayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void) viewDidLoad{
	[super viewDidLoad];
	
	self.data = [DatabaseConnection fetchAllEvents];
	
}

#pragma mark TKCalendarDayViewDelegate
- (NSArray *) calendarDayTimelineView:(TKCalendarDayView*)calendarDayTimeline eventsForDate:(NSDate *)eventDate{
	
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //set new start date
    appDelegate.currentStartDate = [[self dayView] date];
    
    //set new end date
    NSTimeInterval secondsInEightHours = 60 * 60;
    NSDate *dateHourAdded = [appDelegate.currentStartDate dateByAddingTimeInterval:secondsInEightHours];//Add one hour to start date to create and date
    appDelegate.currentEndDate = dateHourAdded;
    
    NSMutableArray *ret = [NSMutableArray array];
	
	for(Event *ev in self.data){
		
		TKCalendarDayEventView *event = [calendarDayTimeline dequeueReusableEventView];
		if(event == nil) event = [TKCalendarDayEventView eventView];
        
		event.identifier = nil;
		event.titleLabel.text = ev.title;
		event.locationLabel.text = ev.notes;
    
		event.startDate = ev.startDate;
		
		event.endDate = ev.endDate;
        
		[ret addObject:event];
		
	}
	return ret;
	
    
}
- (void) calendarDayTimelineView:(TKCalendarDayView*)calendarDayTimeline eventViewWasSelected:(TKCalendarDayEventView *)eventView{
	TKLog(@"%@",eventView.startDate);
}



- (IBAction)modeSelectionButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)signout:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
