//
//  ItemsDataStore.m
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import "ItemsDataStore.h"

@implementation ItemsDataStore

@synthesize myString=_myString;

+ (ItemsDataStore *)defaultStore
{
    static ItemsDataStore *defaultStore = nil;
    if(!defaultStore)
        defaultStore = [[super allocWithZone:nil] init];
    
    return defaultStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self defaultStore];
}

- (id)init
{
    self = [super init];
    if(self) {
    }
    return self;
}

@end
