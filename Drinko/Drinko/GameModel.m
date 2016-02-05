//
//  GameModel.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

-(instancetype) initWithType: (int) gameType
latitude: (double) latitude
andLongitude: (double) longitude
{
    self = [super init];
        if (self) {
            self.type = gameType;
            self.latitude = latitude;
            self.longitude = longitude;
            self.players = [[NSMutableArray alloc] init];
            self.drinks = [[NSMutableArray alloc] init];
       }   
    
    return self;
}

@end
