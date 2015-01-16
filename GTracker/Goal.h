//
//  Goal.h
//  GTracker
//
//  Created by Antonio Martinez on 16/01/2015.
//  Copyright (c) 2015 AMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Goal : NSManagedObject

@property (nonatomic, retain) NSDate * completionDate;
@property (nonatomic, retain) NSDate * startingDate;
@property (nonatomic, retain) NSNumber * goal;
@property (nonatomic, retain) NSNumber * acumulative;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * units;
@property (nonatomic, retain) NSString * name;

@end
