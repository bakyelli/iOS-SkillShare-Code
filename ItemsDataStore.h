//
//  ItemsDataStore.h
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemsDataStore : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (ItemsDataStore *)defaultStore;

@end
