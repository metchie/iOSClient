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
    
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.modeSelectionBut.selectedSegmentIndex = 0;
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

- (IBAction)doneButton:(id)sender {
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    //Create Event Data Object
    Event *event = [[Event alloc] init];
    event.startDate = appDelegate.currentStartDate;
    event.endDate = appDelegate.currentEndDate;
    event.title = [[self titleTextField] text];
    event.notes = [[self notesTextField] text];
    event.type = MANUAL_EVENT;
    
    BOOL dataAdded = [DatabaseConnection addEvent: event];
    
    if (dataAdded) {
        [self dismissViewControllerAnimated:YES completion:nil];

    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error on database"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
