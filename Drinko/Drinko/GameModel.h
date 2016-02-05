//
//  GameModel.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/4/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject
@property (strong, nonatomic) NSMutableArray* players;
@property (strong, nonatomic) NSDate* playedOn;
@property (strong, nonatomic) NSMutableArray* drinks;
@property (strong, nonatomic) NSData* image;
@property int type;
@property double latitude;
@property double longitude;
@end
