//
//  Phone.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Battery.h"
#import "Display.h"

@interface Phone : NSObject
@property (strong,nonatomic) NSString* model;
@property (strong,nonatomic) NSString* owner;
@property (strong,nonatomic) NSString* manufacturer;
@property int price;
@property Battery* battery;
@property Display* display;

-(instancetype) initWithModel: (NSString*) model
                     andOwner: (NSString*) owner
              andManufacturer:(NSString*) manufacturer
                     andPrice: (int) price
                   andBattery: (Battery*) battery
                   andDisplay: (Display*) display;
+(instancetype) initWithModel:(NSString*) model
              andManufacturer: (NSString*) manufacturer;
+(instancetype) initWithModel:(NSString*) model
                     andOwner: (NSString*) owner
              andManufacturer:(NSString *) manufacturer
                   andBattery: (Battery*) battery
                   andDisplay: (Display*) display;
+(instancetype) initWithModel: (NSString*) model
                     andOwner: (NSString*) owner
              andManufacturer:(NSString*) manufacturer
                     andPrice: (int) price
                   andBattery: (Battery*) battery
                   andDisplay: (Display*) display;

+(Phone*)IPhone5s;

@end
