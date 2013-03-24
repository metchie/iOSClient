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
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
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
    
    homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:homeViewController animated:YES completion:NULL];
    
    
}
- (IBAction)registerButton:(id)sender {
}

- (IBAction)loginButton:(id)sender {
}
-(void)dismissKeyboard {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
@end
