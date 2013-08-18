//
//  DetailViewController.h
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;
@interface DetailViewController : UITableViewController
{
    
    __weak IBOutlet UITableViewCell *contentCell;
    __weak IBOutlet UITableViewCell *timeStampCell;
    __weak IBOutlet UIButton *completedButton;
}
- (IBAction)markCompleted:(id)sender;
@property Item *item;
@end
