//
//  Display.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "Display.h"

@implementation Display

@synthesize size = _size;
@synthesize numberOfColors = _numberOfColors;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        //initialization code
    }
    return self;
}

-(instancetype) initWithSize: (int) size
           andNumberOfColors:(int) numberOfColors{
    self = [super init];
    
    if(self){
        self.size = size;
        self.numberOfColors = numberOfColors;
    }
    
    return self;
}

-(int) size
{
    if (!_size) {
        _size = 0;
    }
    return _size;
}

-(void) setSize:(int)size
{
    if (size < 0) {
        [NSException raise:@"Size cannot be negative" format:@"size %d is invalid", size];
    }
    
    _size = size;
}

-(int) numberOfColors
{
    if (!_numberOfColors) {
        _numberOfColors = 0;
    }
    return _numberOfColors;
}

-(void) setNumberOfColors:(int)numberOfColors
{
    if (numberOfColors < 0) {
        [NSException raise:@"number of colors cannot be negative" format:@"number of colors %d is invalid", numberOfColors];
    }
    
    _numberOfColors = numberOfColors;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Display: Size=%d Number of colors=%d", self.size, self.numberOfColors];
}
@end
