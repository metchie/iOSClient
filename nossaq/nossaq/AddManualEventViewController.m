//
//  AddEventViewController.m
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "AddManualEventViewController.h"

@interface AddManualEventViewController ()

@end

@implementation AddManualEventViewController

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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    //Set edit view
    if ([self onEditing]) {
        
        [[self modeSelectionBut] setHidden:YES];//set mode button invisible
        
        [[self doneButton] setTitle:@"Update"];
        
        [self titleTextField].text = [[self editEvent] title];
        [self notesTextField].text = [[self editEvent] notes];
        
        NSString *startDateString = [NSDateFormatter localizedStringFromDate: [[self editEvent] startDate]
                                                                   dateStyle:NSDateFormatterLongStyle
                                                                   timeStyle:NSDateFormatterShortStyle];
        
        [self startsTextField].text = startDateString;
        
        NSString *endDateString = [NSDateFormatter localizedStringFromDate: [[self editEvent] endDate]
                                                                 dateStyle:NSDateFormatterLongStyle
                                                                 timeStyle:NSDateFormatterShortStyle];
        
        [self endsTextField].text = endDateString;
    }
    else {
        
        //Initialize current date
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSString *startDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentStartDate
                                                                   dateStyle:NSDateFormatterLongStyle
                                                                   timeStyle:NSDateFormatterShortStyle];
        
        NSString *endDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentEndDate
                                                                 dateStyle:NSDateFormatterLongStyle
                                                                 timeStyle:NSDateFormatterShortStyle];
        
        [[self startsTextField]setText:startDateString];
        [[self endsTextField] setText:endDateString];
        
    }
    
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.modeSelectionBut.selectedSegmentIndex = 0;
    
    if ([self dateIsChanging]) {
        //Initialize current date
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        NSString *startDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentStartDate
                                                                   dateStyle:NSDateFormatterLongStyle
                                                                   timeStyle:NSDateFormatterShortStyle];
        
        NSString *endDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentEndDate
                                                                 dateStyle:NSDateFormatterLongStyle
                                                                 timeStyle:NSDateFormatterShortStyle];
        
        [[self startsTextField]setText:startDateString];
        [[self endsTextField] setText:endDateString];
        self.dateIsChanging = NO;
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)dismissKeyboard {
    [self.titleTextField resignFirstResponder];
    [self.notesTextField resignFirstResponder];
}

- (IBAction)dateChangeButton:(id)sender {
    self.dateIsChanging = YES;
}

- (IBAction)doneButton:(id)sender {
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    //Create Event Data Object
    Event *event = [[Event alloc] init];
    event.startDate = appDelegate.currentStartDate;
    event.endDate = appDelegate.currentEndDate;
    event.title = [[self titleTextField] text];
    event.notes = [[self notesTextField] text];
    event.type = MANUAL_EVENT;
    
    if (![self onEditing]) { // creating new event
        
        
        BOOL dataAdded = [DatabaseConnection addEvent: event];
        
        if (dataAdded) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error on adding events"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else{// updating an event
        
        BOOL dataAdded = [DatabaseConnection updateExistingEvent:[self editEvent] withNewEvent:event];
        if (dataAdded) {
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error on updating event"
                                                            message:@""
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
