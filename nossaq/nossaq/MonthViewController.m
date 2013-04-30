//
//  HomeViewController.m
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "MonthViewController.h"

@interface MonthViewController ()

@end

@implementation MonthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.monthView selectDate:[NSDate date]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.viewModeSelectionButton.selectedSegmentIndex = 0;
    [self.tableView reloadData];
}

#pragma mark - MonthView Delegate & DataSource
- (NSArray*) calendarMonthView:(TKCalendarMonthView*)monthView marksFromDate:(NSDate*)startDate toDate:(NSDate*)lastDate{
	[self fetchDatesStartDate:startDate endDate:lastDate];
	return self.dataArray;
}

- (void)calendarMonthView:(TKCalendarMonthView *)monthView didSelectDate:(NSDate *)d {
	AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    //set new start date
    appDelegate.currentStartDate = d;
    
    //set new end date
    NSTimeInterval secondsInEightHours = 60 * 60;
    NSDate *dateHourAdded = [appDelegate.currentStartDate dateByAddingTimeInterval:secondsInEightHours];//Add one hour to start date to create and date
    appDelegate.currentEndDate = dateHourAdded;
    
    // CHANGE THE DATE TO YOUR TIMEZONE
    NSDateComponents *info = [d dateComponentsWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    NSDate *myTimeZoneDay = [NSDate dateWithDateComponents:info];
    [myTimeZoneDay dateComponentsWithTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
	
	NSLog(@"Date Selected: %@",myTimeZoneDay);
    
    [self.tableView reloadData];
    
}

- (void) calendarMonthView:(TKCalendarMonthView*)mv monthDidChange:(NSDate*)d animated:(BOOL)animated{
	[super calendarMonthView:mv monthDidChange:d animated:animated];
    
    [self.monthView selectDate:d];
    
    
	[self.tableView reloadData];
}

#pragma mark - UITableView Delegate & DataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSArray *ar = self.dataDictionary[[self.monthView dateSelected]];
	if(ar == nil) return 0;
	return [ar count];
}
- (UITableViewCell *) tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
	
    
	NSArray *ar = self.dataDictionary[[self.monthView dateSelected]];
	cell.textLabel.text = ((Event *)ar[indexPath.row]).title;
	
    return cell;
	
}

- (void) fetchDatesStartDate:(NSDate*)start endDate:(NSDate*)end{
	// this function sets up dataArray & dataDictionary
	// dataArray: has boolean markers for each day to pass to the calendar view (via the delegate function)
	// dataDictionary: has items that are associated with date keys (for tableview)
	
    NSArray *eventsArray = [DatabaseConnection fetchAllEventsBetweenStartDate:start endDate:end];
	
	NSLog(@"Delegate Range: %@ %@ %d",start,end,[start daysBetweenDate:end]);
	
	self.dataArray = [NSMutableArray array];
	self.dataDictionary = [NSMutableDictionary dictionary];
	
    NSDate *d = start;
    int countEventsArray = 0;
    //put the dates into dataArray and dataDictionary
    
    while(YES){
        if(countEventsArray < eventsArray.count){//do it if there is any event left.
            //compare two dates without time.
            NSCalendar *calendar = [NSCalendar currentCalendar];
            NSInteger comps = (NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit);
            
            NSDate *formattedD;
            NSDate *formattedArrayDate;
            
            NSDateComponents *date1Components = [calendar components:comps fromDate: d];
            NSDateComponents *date2Components = [calendar components:comps fromDate:((Event *) [eventsArray objectAtIndex:countEventsArray]).startDate];
            
            
            formattedD = [calendar dateFromComponents:date1Components];
            formattedArrayDate = [calendar dateFromComponents:date2Components];
            
            NSComparisonResult result = [formattedD compare:formattedArrayDate];
            
            if (result == NSOrderedSame && countEventsArray < eventsArray.count) {
                
                //Same date found. Find the other following same dates
                NSMutableArray *tempArray = [[NSMutableArray alloc] init];
                
                while(YES){
                    
                    if (countEventsArray < eventsArray.count) {
                        
                        date2Components = [calendar components:comps fromDate:((Event *) [eventsArray objectAtIndex:countEventsArray]).startDate];
                        formattedArrayDate = [calendar dateFromComponents:date2Components];
                        result = [formattedD compare:formattedArrayDate];
                        
                        if (result == NSOrderedSame) {
                            [tempArray addObject:[eventsArray objectAtIndex:countEventsArray]];
                            countEventsArray++;
                        }
                        else break;
                        
                    }
                    else break;
                    
                }
                
                [self.dataDictionary setObject:[NSArray arrayWithArray:tempArray] forKey:d];
                [self.dataArray addObject:[NSNumber numberWithBool:YES]];
                
            }  else {
                [self.dataArray addObject:[NSNumber numberWithBool:NO]];
            }
        }
        else {
            [self.dataArray addObject:[NSNumber numberWithBool:NO]];
        }
        
        NSDateComponents *info = [d dateComponentsWithTimeZone:self.monthView.timeZone];
		info.day++;
		d = [NSDate dateWithDateComponents:info];
		if([d compare:end]==NSOrderedDescending) break;
        
    }
	
}

#pragma mark - MonthView Button Controllers

- (IBAction)signoutButton:(id)sender {
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    UIViewController* mainViewController = [loginStoryboard instantiateInitialViewController];
    
    mainViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:mainViewController animated:YES completion:NULL];
}

@end
