//
//  DateSelectionViewController.m
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "DateSelectionWithTimeViewController.h"

@interface DateSelectionWithTimeViewController ()

@end

@implementation DateSelectionWithTimeViewController
@synthesize selectedEndDate;
@synthesize selectedStartDate;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialize starts and ends date
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    selectedStartDate = appDelegate.currentStartDate;
    NSString *startDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentStartDate
                                                               dateStyle:NSDateFormatterLongStyle
                                                               timeStyle:NSDateFormatterShortStyle];//Edit format
    [self startsRowField].textLabel.text =  [NSString stringWithFormat:@"Starts: %@", startDateString];
    
    selectedEndDate = appDelegate.currentEndDate;
    NSString *endDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentEndDate
                                                             dateStyle:NSDateFormatterLongStyle
                                                             timeStyle:NSDateFormatterShortStyle];//Edit format
    [self endsRowField].textLabel.text =  [NSString stringWithFormat:@"Ends: %@", endDateString];
    
    
    //Set default selected row 0
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
    
    //Set highlighted color black
    self.startsRowField.textLabel.highlightedTextColor = [UIColor blackColor];
    self.endsRowField.textLabel.highlightedTextColor = [UIColor blackColor];
    
    //Set datepicker's date start date as default
    [self.datePicker setDate:appDelegate.currentStartDate];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)datePicker:(id)sender {
    NSDate *selectedDate = [[self datePicker] date];
    
    NSString *date = [NSDateFormatter localizedStringFromDate:selectedDate
                                                    dateStyle:NSDateFormatterLongStyle
                                                    timeStyle:NSDateFormatterShortStyle];
	
    
    if([[self tableView] indexPathForSelectedRow].row == 0){//if start date selected
        [self startsRowField].textLabel.text =  [NSString stringWithFormat:@"Starts: %@", date];
        self.selectedStartDate = selectedDate;
        
        //set new end date if end date < start date
        
        if([self.selectedStartDate compare: self.selectedEndDate] == NSOrderedDescending) // if start is later in time than end
        {            
            //set new end date - selectedStartHour + 1
            NSTimeInterval secondsInEightHours = 60 * 60;
            NSDate *dateHourAdded = [self.selectedStartDate dateByAddingTimeInterval:secondsInEightHours];//Add one hour to start date to create and date
            NSString *newDate = [NSDateFormatter localizedStringFromDate:dateHourAdded
                                                            dateStyle:NSDateFormatterLongStyle
                                                            timeStyle:NSDateFormatterShortStyle];
            [self endsRowField].textLabel.text =  [NSString stringWithFormat:@"Ends: %@", newDate];
            self.selectedEndDate = dateHourAdded;
         
        }
        
    }
    else{// if end date selected
        [self endsRowField].textLabel.text =  [NSString stringWithFormat:@"Ends: %@", date];
        self.selectedEndDate = selectedDate;
        
        if([self.selectedStartDate compare: self.selectedEndDate] == NSOrderedDescending) // if start is later in time than end
        {
            //set new end date - selectedStartHour + 1
            NSTimeInterval secondsInEightHours = - 60 * 60;
            NSDate *dateHourSubtracted = [self.selectedEndDate dateByAddingTimeInterval:secondsInEightHours];//Add one hour to start date to create and date
            NSString *newDate = [NSDateFormatter localizedStringFromDate:dateHourSubtracted
                                                               dateStyle:NSDateFormatterLongStyle
                                                               timeStyle:NSDateFormatterShortStyle];
            [self endsRowField].textLabel.text =  [NSString stringWithFormat:@"Ends: %@", newDate];
            [self startsRowField].textLabel.text =  [NSString stringWithFormat:@"Starts: %@", newDate];
            self.selectedStartDate = dateHourSubtracted;
            
        }
    }
    
    NSIndexPath *ipath = [self.tableView indexPathForSelectedRow];
    [self.tableView reloadData];
    [self.tableView selectRowAtIndexPath:ipath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (IBAction)doneButton:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.currentStartDate = selectedStartDate;
    appDelegate.currentEndDate = selectedEndDate;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.datePicker setDate:selectedStartDate];
    }
    else{
        [self.datePicker setDate:selectedEndDate];
    }
    
}
@end
