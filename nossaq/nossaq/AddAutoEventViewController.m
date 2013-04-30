//
//  AddAutoEventViewController.m
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "AddAutoEventViewController.h"

@interface AddAutoEventViewController ()

@end

@implementation AddAutoEventViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Initialize current date
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *startDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentStartDate
                                                               dateStyle:NSDateFormatterLongStyle
                                                               timeStyle:NSDateFormatterNoStyle];
  
    NSString *endDateString = [NSDateFormatter localizedStringFromDate: appDelegate.currentEndDate
                                                             dateStyle:NSDateFormatterLongStyle
                                                             timeStyle:NSDateFormatterNoStyle];
    
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
    [self.durationTextField resignFirstResponder];
}

- (IBAction)cancelButton:(id)sender {
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)modeSelectionButton:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 1) {
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
