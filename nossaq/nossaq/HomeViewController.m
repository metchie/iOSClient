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
	TKCalendarMonthView *calendar1=[[TKCalendarMonthView alloc] init];
    
    [calendar1 selectDate:[NSDate date]];
    [self.calenderView addSubview:calendar1];
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.calenderView insertSubview:tableView belowSubview:calendar1];
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
@end
