//
//  TRCoreData.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface TRCoreData : NSObject

@property(nonatomic,strong) NSManagedObjectContext* context;
@property(nonatomic, strong) NSManagedObjectModel* model;
@property(nonatomic, strong) NSPersistentStoreCoordinator* coordinator;
@property(nonatomic, strong) NSPersistentStore* store;

- (void)saveContext;
- (void)setupCoreData;
@end
