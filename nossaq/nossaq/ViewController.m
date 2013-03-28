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
    
    //Add place holder and return key action to text fields
    self.passwordTextField.delegate=self;
    self.usernameTextField.delegate = self;
    self.usernameTextField.placeholder=@"Email";
    self.usernameTextField.returnKeyType=UIReturnKeyGo;
    self.passwordTextField.placeholder=@"Password";
    self.passwordTextField.returnKeyType=UIReturnKeyGo;    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    // Tell the keyboard where to go on next / go button.
    if(textField == self.usernameTextField || textField == self.passwordTextField)
    {
        if ([self login:self.usernameTextField.text password:self.passwordTextField.text]) {
            UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
            UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
            
            homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:homeViewController animated:YES completion:NULL];
        }
    }
    
    return YES;
}

- (IBAction)RegisterButton:(id)sender {
}

- (IBAction)LoginButton:(id)sender {
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
   
    if ([self login:self.usernameTextField.text password:self.passwordTextField.text]) {
        homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
        [self presentViewController:homeViewController animated:YES completion:NULL];
    }
    
}
- (IBAction)registerButton:(id)sender {
}

- (IBAction)loginButton:(id)sender {
}
-(void)dismissKeyboard {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

//Get username and password. Encrypt password in md5 and get authentication from the server.
-(BOOL)login:(NSString *)userName password:(NSString *)password{
    if ([userName isEqual: @"a"] && [password isEqual: @"a"]) {
        return true;
    } else{
        NSLog(@"Wrong email or password! Try again.");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                        message:@"Wrong email or password!"
                                                       delegate:nil
                                              cancelButtonTitle:@"Try again"
                                              otherButtonTitles:nil];
        [alert show];
        return false;
    }
}


@end
