//
//  Game+CoreDataProperties.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Game.h"

NS_ASSUME_NONNULL_BEGIN

@interface Game (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *playedOn;
@property (nullable, nonatomic, retain) NSNumber *latitude;
@property (nullable, nonatomic, retain) NSNumber *longitude;
@property (nullable, nonatomic, retain) NSNumber *type;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *players;
@property (nullable, nonatomic, retain) NSSet<Drink *> *drinks;

@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(NSManagedObject *)value;
- (void)removePlayersObject:(NSManagedObject *)value;
- (void)addPlayers:(NSSet<NSManagedObject *> *)values;
- (void)removePlayers:(NSSet<NSManagedObject *> *)values;

- (void)addDrinksObject:(Drink *)value;
- (void)removeDrinksObject:(Drink *)value;
- (void)addDrinks:(NSSet<Drink *> *)values;
- (void)removeDrinks:(NSSet<Drink *> *)values;

@end

NS_ASSUME_NONNULL_END
