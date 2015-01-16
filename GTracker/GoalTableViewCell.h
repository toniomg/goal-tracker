//
//  GoalTableViewCell.h
//  GTracker
//
//  Created by Antonio Martinez on 16/01/2015.
//  Copyright (c) 2015 AMG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoalTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *goal;
@property (weak, nonatomic) IBOutlet UILabel *endDate;

@end
