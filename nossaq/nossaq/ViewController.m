//
//  ViewController.m
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RegisterButton:(id)sender {
}

- (IBAction)LoginButton:(id)sender {
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
    
    homeViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:homeViewController animated:YES completion:nil];
}
- (IBAction)registerButton:(id)sender {
}

- (IBAction)loginButton:(id)sender {
}
@end
