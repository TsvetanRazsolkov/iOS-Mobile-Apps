//
//  PlayerModel.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerModel : NSObject

@property (strong, nonatomic) NSMutableArray* drinks;
@property (strong, nonatomic) NSString* name;

-(instancetype) initWithName: (NSString*) name;
@end
