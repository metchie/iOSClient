//
//  RegisterViewController.m
//  nossaq
//
//  Created by Aykut on 3/30/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
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
    [[self scroll] setContentSize:CGSizeMake(320, 600)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    
    if ([_usernameTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                        message:@"Please enter your username"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if ([_emailTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                        message:@"Please enter your email"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if ([_nameTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                        message:@"Please enter your name"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    if ([_surnameTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                        message:@"Please enter your surname"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if ([_passwordTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Information"
                                                        message:@"Please enter your password"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    if (!([_passwordTextField.text isEqualToString:_confirmPasswordTextField.text])) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passwords does not match"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    BOOL dataAdded = [DatabaseConnection addAccountUsername:_usernameTextField.text
                                  password:_passwordTextField.text
                                     email:_emailTextField.text name:_nameTextField.text
                                   surname:_surnameTextField.text];
    
    if (dataAdded) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Registered Succesfully"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error on database"
                                                        message:@""
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    
    [self clearTextFields]; //clear text fields after add operation
    
    //return to login screen
    UIStoryboard *registerStoryboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    UIViewController* registerStoryViewController = [registerStoryboard instantiateInitialViewController];
    registerStoryViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:registerStoryViewController animated:YES completion:NULL];
}

- (IBAction)cancelButton:(id)sender {
    UIStoryboard *registerStoryboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:nil];
    UIViewController* registerStoryViewController = [registerStoryboard instantiateInitialViewController];
    registerStoryViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:registerStoryViewController animated:YES completion:NULL];
}

-(void)clearTextFields{
    _usernameTextField.text = @"";
    _passwordTextField.text = @"";
    _confirmPasswordTextField.text = @"";
    _emailTextField.text = @"";
    _nameTextField.text = @"";
    _surnameTextField.text = @"";
}

@end
