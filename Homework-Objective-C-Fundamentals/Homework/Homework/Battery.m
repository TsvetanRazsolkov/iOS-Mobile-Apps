//
//  Battery.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "Battery.h"

@implementation Battery

@synthesize hoursIdle = _hoursIdle;
@synthesize hoursTalk = _hoursTalk;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        //initialization code
    }
    return self;
}

-(instancetype) initWithType:(BatteryType) type
                andHoursIdle:(int) hoursIdle
                andHoursTalk:(int) hoursTalk{
    self = [super init];
    
    if(self) {
        self.type = type;
        self.hoursIdle = hoursIdle;
        self.hoursTalk = hoursTalk;
    }
    
    return self;
}

-(instancetype) initWithType:(BatteryType) type
                andHoursIdle:(int) hoursIdle{
    
    if(self) {
        self.type = type;
        self.hoursIdle = hoursIdle;
    }
    
    return self;
}

-(instancetype) initWithType:(BatteryType) type
                andHoursTalk:(int) hoursTalk{
    
    if(self) {
        self.type = type;
        self.hoursTalk = hoursTalk;
    }
    
    return self;
}

-(int) hoursIdle
{
    if (!_hoursIdle) {
        _hoursIdle = 10;
    }
    
    return _hoursIdle;
}

-(void) setHoursIdle:(int)hoursIdle
{
    if (hoursIdle < 0) {
        [NSException raise:@"hours idle cannot be negative" format:@"hours idle %d is invalid", hoursIdle];
    }
    
    _hoursIdle = hoursIdle;
}

-(int) hoursTalk
{
    if (!_hoursTalk) {
        _hoursTalk = 10;
    }
    
    return _hoursTalk;
}

-(void) setHoursTalk:(int)hoursTalk
{
    if (hoursTalk < 0) {
        [NSException raise:@"hours talk cannot be negative" format:@"hours talk %d is invalid", hoursTalk];
    }
    
    _hoursTalk = hoursTalk;
}

- (NSString *)description {
    return [NSString stringWithFormat: @"Battery: Type=%u Hours Idle:%d Hours Talk:%d",self.type,self.hoursIdle,self.hoursTalk];
}
@end
