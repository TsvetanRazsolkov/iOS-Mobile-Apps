//
//  Display.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Display : NSObject
@property int size;
@property int numberOfColors;

-(instancetype) initWithSize: (int) size
           andNumberOfColors:(int) numberOfColors;
@end
