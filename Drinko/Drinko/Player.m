//
//  Player.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "Player.h"
#import "Drink.h"
#import "Game.h"

@implementation Player

// Insert code here to add functionality to your managed object subclass
-(NSString *)description{
    NSString* desc = [NSString stringWithFormat:@"%@ drank %@", self.name, [[self.drinks allObjects] componentsJoinedByString:@","] ];
    return desc;
}

@end
