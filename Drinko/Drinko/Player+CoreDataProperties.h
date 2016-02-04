//
//  Player+CoreDataProperties.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface Player (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Game *game;
@property (nullable, nonatomic, retain) NSSet<Drink *> *drinks;

@end

@interface Player (CoreDataGeneratedAccessors)

- (void)addDrinksObject:(Drink *)value;
- (void)removeDrinksObject:(Drink *)value;
- (void)addDrinks:(NSSet<Drink *> *)values;
- (void)removeDrinks:(NSSet<Drink *> *)values;

@end

NS_ASSUME_NONNULL_END
