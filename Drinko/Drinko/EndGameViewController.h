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

@interface EndGameViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property GameModel* game;
@property (strong, nonatomic) TRCoreData *dataHelper;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;

@end
