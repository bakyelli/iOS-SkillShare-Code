//
//  DetailViewController.m
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import "ItemsDataStore.h"

@implementation DetailViewController

@synthesize item=_item;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[contentCell textLabel] setText:self.item.content];
    if (self.item.completed)
    {
        [completedButton setTitle:@"Mark Not Completed" forState:UIControlStateNormal];
    } 
    [[timeStampCell textLabel] setText:[NSDateFormatter localizedStringFromDate:[NSDate dateWithTimeIntervalSinceReferenceDate:self.item.timeStamp]
                                                                      dateStyle:NSDateFormatterShortStyle
                                                                      timeStyle:NSDateFormatterShortStyle]];
    
}

- (IBAction)markCompleted:(id)sender {
    self.item.completed=!self.item.completed;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
