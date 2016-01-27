//
//  DetailsViewController.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/27/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manufacturerLabel.text = self.phone.manufacturer;
    self.modelLabel.text = self.phone.model;
    self.priceLabel.text =  [NSString stringWithFormat:@"%d",self.phone.price];
    self.ownerLabel.text = self.phone.owner;
    
    if (self.phone.battery.type == LiIon) {
        self.batteryTypeLabel.text = @"LiIon";
    }
    else if(self.phone.battery.type == NiCD){
        self.batteryTypeLabel.text = @"NiCD";
    }
    else if(self.phone.battery.type == NiMH){
        self.batteryTypeLabel.text = @"NiMH";
    }
    self.batteryHoursIdleLabel.text = [NSString stringWithFormat:@"%d",self.phone.battery.hoursIdle];
    self.batteryHoursTalkLabel.text = [NSString stringWithFormat:@"%d",self.phone.battery.hoursTalk];
    
    self.displaySizeLabel.text = [NSString stringWithFormat:@"%d",self.phone.display.size];
    self.displayColoursLabel.text = [NSString stringWithFormat:@"%d",self.phone.display.numberOfColors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
