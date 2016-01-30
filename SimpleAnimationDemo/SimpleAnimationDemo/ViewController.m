//
//  ViewController.m
//  SimpleAnimationDemo
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize animator = _animator;
UICollisionBehavior* _collision;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bombImage.layer.cornerRadius = 65;
    self.bombImage.layer.masksToBounds = YES;
    self.bombImage.layer.borderWidth = 3.0f;
    
    self.bombImage.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.bombImageSecond.layer.cornerRadius = 65;
    self.bombImageSecond.layer.masksToBounds = YES;
    self.bombImageSecond.layer.borderWidth = 3.0f;
    
    self.bombImageSecond.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.staticBombImage.layer.masksToBounds = YES;
    self.staticBombImage.layer.borderWidth = 3.0f;
    
    self.staticBombImage.layer.borderColor = [UIColor blackColor].CGColor;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender {
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.bombImage, self.bombImageSecond]];
    [_animator addBehavior:gravityBehavior];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.bombImage, self.bombImageSecond]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    CGPoint rightEdge = CGPointMake(self.staticBombImage.frame.origin.x +
                                    self.staticBombImage.frame.size.width, self.staticBombImage.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"staticBombImage"
                                fromPoint:self.staticBombImage.frame.origin
                                  toPoint:rightEdge];
    [_animator addBehavior:_collision];
    }
@end
