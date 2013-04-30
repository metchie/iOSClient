//
//  AddEventViewController.h
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddManualEventViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelectionBut;
@property (weak, nonatomic) IBOutlet UITextField *notesTextField;
@property (weak, nonatomic) IBOutlet UITextField *startsTextField;
@property (weak, nonatomic) IBOutlet UITextField *endsTextField;


- (IBAction)doneButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
@end
