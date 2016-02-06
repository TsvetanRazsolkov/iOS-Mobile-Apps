//
//  EndGameViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/6/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRCoreData.h"
#import "GameModel.h"

@interface EndGameViewController : UIViewController

@property GameModel* game;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
