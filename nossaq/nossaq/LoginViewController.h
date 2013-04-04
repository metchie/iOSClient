//
//  ViewController.h
//  nossaq
//
//  Created by Aykut on 3/6/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerConnection.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>
- (IBAction)registerButton:(id)sender;
- (IBAction)loginButton:(id)sender;
-(BOOL)login:(NSString *)userName password:(NSString *)password;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end
