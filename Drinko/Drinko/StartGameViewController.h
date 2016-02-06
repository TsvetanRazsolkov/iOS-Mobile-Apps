//
//  StartGameViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"

@interface StartGameViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property GameModel* game;

@end
