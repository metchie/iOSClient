//
//  DateSelectionViewController.h
//  nossaq
//
//  Created by Aykut on 4/14/13.
//  Copyright (c) 2013 nossaq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateSelectionWithTimeViewController : UITableViewController

@property (strong, nonatomic) NSDate  *selectedStartDate;
@property (strong, nonatomic) NSDate  *selectedEndDate;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITableViewCell *startsRowField;
@property (weak, nonatomic) IBOutlet UITableViewCell *endsRowField;


- (IBAction)cancelButton:(id)sender;
- (IBAction)doneButton:(id)sender;
- (IBAction)datePicker:(id)sender;

@end
