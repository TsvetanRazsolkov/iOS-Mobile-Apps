//
//  GameInfoTableViewCell.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/31/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameInfoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gameInfoImageView;
@property (weak, nonatomic) IBOutlet UILabel *gameInfoPlayersLabel;

@end
