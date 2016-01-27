//
//  Phone.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "Phone.h"

@implementation Phone

@synthesize model = _model;
@synthesize manufacturer = _manufacturer;

-(instancetype) initWithModel: (NSString*) model
                     andOwner: (NSString*) owner
              andManufacturer:(NSString*) manufacturer
                     andPrice: (int) price
                   andBattery: (Battery*) battery
                   andDisplay: (Display*) display{
    self = [super init];
    if (self) {
        self.model = model;
        self.owner = owner;
        self.manufacturer = manufacturer;
        self.price = price;
        self.battery = battery;
        self.display = display;
    }
    
    return self;
}

-(instancetype) initWithModel:(NSString*) model
                     andManufacturer: (NSString*) manufacturer{
    
    
    return [self initWithModel:model andOwner:nil andManufacturer:manufacturer andPrice:NAN andBattery:nil andDisplay:nil];
}

-(instancetype) initWithModel: (NSString*) model
                     andOwner: (NSString*) owner
              andManufacturer:(NSString*) manufacturer
                   andBattery: (Battery*) battery
                   andDisplay: (Display*) display{
    
    return [self initWithModel:model andOwner:owner andManufacturer:manufacturer andPrice:NAN andBattery:battery andDisplay:display];
}

+(instancetype) initWithModel:(NSString *)model andManufacturer:(NSString *)manufacturer{
    return [[Phone alloc]initWithModel:model andManufacturer:manufacturer];
}
+(instancetype) initWithModel:(NSString *)model andOwner:(NSString *)owner andManufacturer:(NSString *)manufacturer andBattery:(Battery*)battery andDisplay:(Display*)display{
    return [[Phone alloc]initWithModel:model andOwner:owner andManufacturer:manufacturer andBattery:battery andDisplay:display];
}

+(instancetype) initWithModel:(NSString *)model andOwner:(NSString *)owner andManufacturer:(NSString *)manufacturer andPrice:(int)price andBattery:(Battery *)battery andDisplay:(Display *)display{
    return [[Phone alloc]initWithModel:model andOwner:owner andManufacturer:manufacturer andPrice:price andBattery:battery andDisplay:display];
}

-(NSString*) model
{
    if (!_model) {
        _model = @"Gosho";
    }
    
    return _model;
}

-(void) setModel:(NSString *)model
{
    if (!model || [model isEqualToString:@""]) {
        [NSException raise:@"model cannot be null or empty" format:@"model %@ is invalid", model];
    }
    
    _model = model;
}

-(NSString*) manufacturer
{
    if (!_manufacturer) {
        _manufacturer = @"Pesho";
    }
    
    return _manufacturer;
}

-(void) setManufacturer:(NSString *)manufacturer
{
    if (!manufacturer || [manufacturer isEqualToString:@""]) {
        [NSException raise:@"manufacturer cannot be null or empty" format:@"manufacturer %@ is invalid", manufacturer];
    }
    
    _manufacturer = manufacturer;
}



+(Phone*)IPhone5s{
    Battery *bat = [[Battery alloc]initWithType:LiIon andHoursIdle:5 andHoursTalk:1];
    Display *disp = [[Display alloc]initWithSize:5 andNumberOfColors:65500];
    
    return [[Phone alloc]initWithModel:@"iPhone 5s" andOwner:@"Tosho Krokodila" andManufacturer:@"Apple" andPrice:5000 andBattery:bat andDisplay:disp];
}

- (NSString *)description {
    return [NSString stringWithFormat: @"%@ %@ Price=%d Owner=%@ Battery=%@ Display=%@", self.manufacturer, self.model,  self.price, self.owner,self.battery.description,self.display.description];
}

@end
