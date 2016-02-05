//
//  DrinkModel.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/5/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrinkModel : NSObject

@property (strong, nonatomic) NSString* name;

-(instancetype) initWithName: (NSString*) name;
@end
