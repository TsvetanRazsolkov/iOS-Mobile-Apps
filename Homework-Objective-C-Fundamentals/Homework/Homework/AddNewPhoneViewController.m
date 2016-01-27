//
//  AddNewPhoneViewController.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/27/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "AddNewPhoneViewController.h"

#import "ViewController.h"

@interface AddNewPhoneViewController ()

@end

@implementation AddNewPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.phones) {
        self.phones = [[NSMutableArray alloc] init] ;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ViewController* toVC = segue.destinationViewController;
    toVC.phones = self.phones;
}

- (IBAction)addPhoneButtonClicked:(id)sender {
    // check if the Add button was clicked
    if([self.modelTextBox.text length] != 0 && [self.manufacturerTextBox.text length] != 0){
        NSString *model = self.modelTextBox.text;
        NSString *manufacturer = self.manufacturerTextBox.text;
        NSString *owner = self.ownerTextBox.text;
        int price = (int)[self.priceTextBox.text integerValue];
        
        //NSString *batteryType = self.batteryTypeTextBox.text;
        int batteryIdle = (int)[self.batteryHoursIdleTextBox.text integerValue];
        int batteryTalk = (int)[self.batteryHoursTalkTextBox.text integerValue];
        
        Battery *bat = [[Battery alloc] initWithType:LiIon andHoursIdle:batteryIdle andHoursTalk:batteryTalk];
        
        int displaySize = (int)[self.displaySizeTextBox.text integerValue];
        int displayColors = (int)[self.displayColoursTextBox.text integerValue];
        
        Display *disp =[[Display alloc]initWithSize:displaySize andNumberOfColors:displayColors];
        
        Phone* phone = [Phone initWithModel:model andOwner:owner andManufacturer:manufacturer andPrice:price andBattery:bat andDisplay:disp];
        
        [self.phones insertObject:phone atIndex:0];
    }
    else{
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Cannot add phone without manufacturer and model"
                                      message:@"Phone must have manufacturer and model."
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        
                                    }];
//        UIAlertAction* noButton = [UIAlertAction
//                                   actionWithTitle:@"No, thanks"
//                                   style:UIAlertActionStyleDefault
//                                   handler:^(UIAlertAction * action)
//                                   {
//                                       //Handel no, thanks button
//                                       
//                                   }];
        
        [alert addAction:yesButton];
//        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];    }
}
@end
