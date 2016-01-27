//
//  AddNewPhoneViewController.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/27/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Phone.h"

@interface AddNewPhoneViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *phones;

@property (weak, nonatomic) IBOutlet UITextField *modelTextBox;
@property (weak, nonatomic) IBOutlet UITextField *manufacturerTextBox;
@property (weak, nonatomic) IBOutlet UITextField *ownerTextBox;
@property (weak, nonatomic) IBOutlet UITextField *priceTextBox;
@property (weak, nonatomic) IBOutlet UITextField *displaySizeTextBox;
@property (weak, nonatomic) IBOutlet UITextField *displayColoursTextBox;
@property (weak, nonatomic) IBOutlet UITextField *batteryHoursIdleTextBox;
@property (weak, nonatomic) IBOutlet UITextField *batteryHoursTalkTextBox;
@property (weak, nonatomic) IBOutlet UIButton *addPhoneButton;
@end
