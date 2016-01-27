//
//  DetailsViewController.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/27/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Phone.h"

@interface DetailsViewController : UIViewController
@property (strong, nonatomic) Phone* phone;

@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet UILabel *modelLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryHoursIdleLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryHoursTalkLabel;
@property (weak, nonatomic) IBOutlet UILabel *displaySizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *displayColoursLabel;

@end
