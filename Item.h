//
//  Item.h
//  Senarai
//
//  Created by Joe Burgess on 8/18/13.
//  Copyright (c) 2013 The Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic) NSTimeInterval timeStamp;
@property (nonatomic, retain) NSString * content;
@property (nonatomic) BOOL completed;

@end
