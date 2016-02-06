//
//  EndGameViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/6/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "EndGameViewController.h"

@implementation EndGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    self.title = @"End game page";
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"commonBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    
    // Do any additional setup after loading the view from its nib.
}

@end
