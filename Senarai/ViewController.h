//
//  ViewController.h
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;
@interface ViewController : UITableViewController <UITableViewDataSource, UITextFieldDelegate>
{
    UIButton *cancelButton;
    UITextField *insertTextField;
}


@property (strong, nonatomic) DetailViewController *detailViewController;


- (void)insertNewObject:(NSString *)content;
- (void) addButtonPressed:(id) sender;
- (void) cancelButtonPressed:(id) sender;
@end
