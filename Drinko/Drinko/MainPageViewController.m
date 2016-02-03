//
//  MainPageViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "MainPageViewController.h"
#import "StartGameViewController.h"

@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnPlayWithTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayWithSix;
@property (weak, nonatomic) IBOutlet UIButton *btnLatest;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main Page";
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"mainPageBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.btnPlayWithSix.layer.cornerRadius = 20;
    self.btnPlayWithTwo.layer.cornerRadius = 20;
    self.btnLatest.layer.cornerRadius=20;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSString *toAddNewPhone = @"toAddNewPhone";
    //    Phone *selectedPhone;
        if ([segue.identifier isEqualToString:@"playWithTwoSegue"]) {
            // Create game with type with two players and set it to the next controller as property;
            StartGameViewController* toVC = segue.destinationViewController;
            //toVC.game = created game;
        }
        else if([segue.identifier isEqualToString:@"playWithSixSegue"]){
            // Create game with type with six players and set it to the next controller as property;
            StartGameViewController* toVC = segue.destinationViewController;
            //toVC.game = created game;
        }
}


@end
