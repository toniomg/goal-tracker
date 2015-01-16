//
//  GoalSelectionViewController.m
//  GTracker
//
//  Created by Antonio Martinez on 16/01/2015.
//  Copyright (c) 2015 AMG. All rights reserved.
//

#import "GoalSelectionViewController.h"
#import "Goal.h"
#import "AppDelegate.h"

static NSString *kDateCellID = @"DateDisplayCell";     // the cell with the end date
static NSString *kDatePickerID = @"DatePickerCell"; // the cell with the date picker

@interface GoalSelectionViewController ()

@property (nonatomic, strong) NSDate *goalDate;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GoalSelectionViewController

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;

    if([indexPath row] == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kDateCellID];
    }
    else if ([indexPath row] == 1) {
         cell = [tableView dequeueReusableCellWithIdentifier:kDatePickerID];
    }
    
    return cell;
}

#pragma mark - User actions

//The date of the picker has changed
- (IBAction)dateChanged:(id)sender {
    
    UIDatePicker *datePicker = sender;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:datePicker.date];
    
    self.goalDate = datePicker.date;
}


//The user has pressed the done button
- (IBAction)donePressed:(id)sender {
    
    if (self.goalDate) {
        //Save the new created goal
        NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        Goal *goal = [NSEntityDescription insertNewObjectForEntityForName:@"Goal" inManagedObjectContext:moc];
        goal.completionDate = self.goalDate;
        goal.startingDate = [NSDate date];
        [moc save:nil];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
