//
//  AddAutoEventViewController.h
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddAutoEventViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *notesTextField;
- (IBAction)cancelButton:(id)sender;
- (IBAction)modeSelectionButton:(id)sender;

@end
