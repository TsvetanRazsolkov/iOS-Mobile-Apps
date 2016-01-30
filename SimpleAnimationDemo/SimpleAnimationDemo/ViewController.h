//
//  ViewController.h
//  SimpleAnimationDemo
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) UIDynamicAnimator* animator;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIImageView *bombImageSecond;

@property (weak, nonatomic) IBOutlet UIImageView *bombImage;
@property (weak, nonatomic) IBOutlet UIImageView *staticBombImage;
- (IBAction)Start:(id)sender;

@end

