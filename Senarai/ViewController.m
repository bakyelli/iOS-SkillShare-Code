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
#import "DetailViewController.h"

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
    [self setDetailViewController:[[DetailViewController alloc] init]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)cancelButtonPressed: (id)sender
{
    NSLog(@"Pressed Cancel Button!");
}

- (void)addButtonPressed:(id)sender
{
    // Make Text Field
    CGRect textFieldFrame = CGRectMake(-235.0, 7.0, 230.0, 30.0f);
    
    // Format Text Field
    insertTextField.placeholder = @"Enter Text!";
    insertTextField.backgroundColor = [UIColor whiteColor];
    insertTextField.textColor = [UIColor blackColor];
    insertTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    insertTextField.borderStyle = UITextBorderStyleRoundedRect;
    insertTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    insertTextField.returnKeyType = UIReturnKeyDone;

    // Make Cancel Button
    cancelButton.frame = CGRectMake(330, 8.0, 70, 30); // initialize the button outside the window
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    
    // Do Something on Tap
    [cancelButton addTarget:self action:@selector(cancelButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
   
    // Adding Background Image
    UIImage* buttonImage =[[UIImage imageNamed:@"CancelButton.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    UIImage* buttonImagePressed =[[UIImage imageNamed:@"CancelButtonPressed.png"] stretchableImageWithLeftCapWidth:5.0 topCapHeight:0.0];
    [cancelButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [cancelButton setBackgroundImage:buttonImagePressed forState:UIControlStateHighlighted];
    
    // Add Cancel Button
    self.navigationItem.leftBarButtonItem = nil;
    [self.navigationController.navigationBar addSubview: cancelButton];
   
    // Add Insert Text Field
    self.navigationItem.rightBarButtonItem = nil;
    [self.navigationItem.titleView setHidden:YES];
    [self.navigationController.navigationBar addSubview:insertTextField];
    
    // Bring up keyboard
    [insertTextField becomeFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        cancelButton.frame = CGRectMake(243, 8.0, 70, 30);  // here is the position button will slide into window with animation
        insertTextField.frame = CGRectMake(5.0, 7.0, 230.0, 30.0f);
    }];
    
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
    NSDictionary* attributes = @{
                                 NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]
                                 };
    NSAttributedString *attrText;
    if(item.completed){
        attrText = [[NSAttributedString alloc] initWithString:[item valueForKey:@"content"] attributes:attributes];
    } else {
        attrText = [[NSAttributedString alloc] initWithString:[item valueForKey:@"content"] attributes:nil];
    }
    cell.textLabel.attributedText=attrText;
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSManagedObject *object = [[[ItemsDataStore defaultStore]fetchedResultsController] objectAtIndexPath:indexPath];
        [[segue destinationViewController] setItem:(Item *)object];
    }
}

@end
