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
        if ([self login:self.usernameTextField.text password:self.passwordTextField.text]) {
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
    //    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    //    UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
    //
    //    NSString * connectionURL = @"http://139.179.103.55:9000";
    //    NSString * methodName = @"example2";
    //
    //    NSMutableArray *params= [[NSMutableArray alloc] init];
    //    NSString * para1 = @"15";
    //    NSString * para2 = @"16";
    //    [params addObject:para1];
    //    [params addObject:para2];
    //
    //    [ServerConnection getDataWithGETConnection:connectionURL MethodName:methodName Paramater:params];
    //
    //    if ([self login:self.usernameTextField.text password:self.passwordTextField.text]) {
    //
    //        homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    //        [self presentViewController:homeViewController animated:YES completion:NULL];
    //    }
    //[ServerConnection sendXMLWithPOSTConnetion];
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"HomeStoryboard" bundle:nil];
    UIViewController* homeViewController = [homeStoryboard instantiateInitialViewController];
    if ([self login:self.usernameTextField.text password:self.passwordTextField.text]) {
                homeViewController.modalPresentationStyle = UIModalPresentationPageSheet;
            [self presentViewController:homeViewController animated:YES completion:NULL];
    }
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
