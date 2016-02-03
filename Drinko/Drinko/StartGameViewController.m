//
//  StartGameViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "StartGameViewController.h"

@interface StartGameViewController ()

@end

@implementation StartGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Players and Drinks";
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"commonBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.btnAddPlayer.layer.cornerRadius = 15;
    self.btnAddDrink.layer.cornerRadius=15;
    self.btnStartGame.layer.cornerRadius = 15;
    
    self.labelPlayerNames.layer.cornerRadius = 20;
    self.labelPlayerNames.layer.masksToBounds = YES;
    self.labelDrinks.layer.cornerRadius = 20;
    self.labelDrinks.layer.masksToBounds = YES;
    
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)AddPLayer:(id)sender {
}
- (IBAction)AddDrink:(id)sender {
}
@end
