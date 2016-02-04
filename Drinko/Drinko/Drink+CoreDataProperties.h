//
//  Drink+CoreDataProperties.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Drink.h"

NS_ASSUME_NONNULL_BEGIN

@interface Drink (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Game *game;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *players;

@end

@interface Drink (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(NSManagedObject *)value;
- (void)removePlayersObject:(NSManagedObject *)value;
- (void)addPlayers:(NSSet<NSManagedObject *> *)values;
- (void)removePlayers:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
