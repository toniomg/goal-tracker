//
//  GoalListTableViewController.m
//  GTracker
//
//  Created by Antonio Martinez on 16/01/2015.
//  Copyright (c) 2015 AMG. All rights reserved.
//

#import "GoalListTableViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "GoalTableViewCell.h"
#import "Goal.h"

@interface GoalListTableViewController ()

@property (nonatomic, strong) NSFetchedResultsController *fetchedController;

@end

@implementation GoalListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSManagedObjectContext *moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];

    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"Goal" inManagedObjectContext:moc]];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"startingDate" ascending:YES]]];
    
    self.fetchedController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
    [self.fetchedController performFetch:nil];
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.fetchedController.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.fetchedController.sections objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GoalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoalListCell"];
    
    Goal *goal = [self.fetchedController objectAtIndexPath:indexPath];
    cell.title.text = goal.name;
    cell.goal.text = [NSString stringWithFormat:@"%@", goal.goal];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    cell.endDate.text = [dateFormatter stringFromDate:goal.completionDate];;
    
    return cell;
}


@end
