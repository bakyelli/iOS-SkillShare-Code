//
//  ViewController.m
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import "ViewController.h"
#import "ItemsDataStore.h"
#import "Item.h"
#import <CoreData/CoreData.h>

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set Nav Bar title
    [[self navigationItem] setTitle:@"Items"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [[ItemsDataStore defaultStore] setTableView:self.tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButtonPressed:(id)sender
{
    Item *newItem = [[ItemsDataStore defaultStore] createItem];
    newItem.content=@"New Item";
    [[ItemsDataStore defaultStore] insertItem:newItem];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[[[ItemsDataStore defaultStore] fetchedResultsController] sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[[ItemsDataStore defaultStore] fetchedResultsController] sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Item *item = [[[ItemsDataStore defaultStore] fetchedResultsController] objectAtIndexPath:indexPath];
    cell.textLabel.text=item.content;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[ItemsDataStore defaultStore] deleteItem:indexPath];
    }
}



@end
