//
//  ViewController.m
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    //Add place holder and return key action to text fields
    self.passwordTextField.delegate=self;
    self.usernameTextField.delegate = self;
    self.usernameTextField.returnKeyType=UIReturnKeyGo;
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
        if ([self loginCheckUsername:self.usernameTextField.text password:self.passwordTextField.text]) {
            UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
            UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
            
            homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:homeViewController animated:YES completion:NULL];
        }
    }
    
    return YES;
}

- (IBAction)registerButton:(id)sender {
    UIStoryboard *registerStoryboard = [UIStoryboard storyboardWithName:@"RegisterStoryboard" bundle:nil];
    UIViewController* registerStoryViewController = [registerStoryboard instantiateInitialViewController];
    registerStoryViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:registerStoryViewController animated:YES completion:NULL];
}

- (IBAction)loginButton:(id)sender {
    
    [ServerConnection sendXMLWithPOSTConnection];
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
    if ([self loginCheckUsername:self.usernameTextField.text password:self.passwordTextField.text]) {
                homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:homeViewController animated:YES completion:NULL];
    }
}
-(void)dismissKeyboard {
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

//Get username and password. Encrypt password in md5 and get authentication from the server.
-(BOOL)loginCheckUsername:(NSString *)userName password:(NSString *)password{
    if ([DatabaseConnection checkAccountUserName:userName password:password]) {
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
