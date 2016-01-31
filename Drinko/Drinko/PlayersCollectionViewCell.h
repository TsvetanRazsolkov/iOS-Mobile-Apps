//
//  PlayersCollectionViewCell.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/1/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *playerNameLabel;

@end
