//
//  DrinkModel.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/5/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "DrinkModel.h"

@implementation DrinkModel

-(instancetype) initWithName: (NSString*) name{
    self = [super init];
    if (self) {
        self.name = name;
    }
    
    return self;
}

@end
