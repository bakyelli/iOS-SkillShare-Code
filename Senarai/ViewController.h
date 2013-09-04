//
//  ViewController.h
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@interface ViewController : UITableViewController <UITableViewDataSource>
{
}


@property (strong, nonatomic) DetailViewController *detailViewController;
- (void) addButtonPressed:(id) sender;
- (void) cancelButtonPressed:(id) sender;
@end
