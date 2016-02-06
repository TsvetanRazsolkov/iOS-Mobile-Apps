//
//  PlayerModel.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "PlayerModel.h"

@implementation PlayerModel

-(instancetype) initWithName: (NSString*) name{
    self = [super init];
    if (self) {
        self.name = name;
        self.drinks = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSString *)description{
    return self.name;
}

@end
