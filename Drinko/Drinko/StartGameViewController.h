//
//  StartGameViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayerName;
@property (weak, nonatomic) IBOutlet UIButton *btnAddPlayer;
- (IBAction)AddPLayer:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelPlayerNames;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDrink;
@property (weak, nonatomic) IBOutlet UIButton *btnAddDrink;
- (IBAction)AddDrink:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *labelDrinks;
@property (weak, nonatomic) IBOutlet UIButton *btnStartGame;

@property NSMutableArray* players;
@property NSMutableArray* drinks;

@end
