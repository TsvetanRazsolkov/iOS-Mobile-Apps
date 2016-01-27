//
//  Battery.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Battery : NSObject
typedef enum batteryType{
    LiIon,
    NiMH,
    NiCD
} BatteryType;

@property BatteryType type;
@property int hoursIdle;
@property int hoursTalk;

-(instancetype) initWithType:(BatteryType) type
                andHoursIdle:(int) hoursIdle
                andHoursTalk:(int) hoursTalk;
@end
