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
    calendar1.delegate = self;
    calendar1.dataSource = self;
    [calendar1 selectDate:[NSDate date]];
    [self.view addSubview:calendar1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
