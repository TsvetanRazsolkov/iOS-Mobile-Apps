//
//  GameViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/1/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property double latitude;
@property double longitude;

@property UIDynamicAnimator* animator;
@property UICollisionBehavior* collision;
@property NSMutableArray* obstacles;
@property Boolean isChipDropped;
@property UIView* playerChip;

- (IBAction)tapGesture:(id)sender;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Play Page";
    [self getLocation];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"gamePageBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    // this will be moved to a separate method once i get the hang of it
    self.obstacles = [[NSMutableArray alloc]init];
    [self drawScene];
    // Do any additional setup after loading the view.
}

-(void) drawScene{
    int y = 145;
    int x = 10;
    for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 7; col++) {
            if (col == 0 && row % 2 == 0) {
                x = 40;
            }
            else if(col == 0 && row % 2 == 1){
                x = 10;
            }
            
            if (row % 2 == 1 && x > self.view.bounds.size.width - 50) {
                UIView* obstacle = [[UIView alloc] initWithFrame:
                                    CGRectMake(self.view.bounds.size.width - 50, y, 7, 7)];
                obstacle.layer.cornerRadius = obstacle.bounds.size.width / 2;
                obstacle.layer.masksToBounds = YES;
                obstacle.backgroundColor = [UIColor whiteColor];
                obstacle.layer.borderWidth = 1.5f;
                obstacle.layer.borderColor = [UIColor blackColor].CGColor;
                [self.obstacles addObject:obstacle];
                [self.view addSubview:obstacle];
                continue;
            }
            
            UIView* obstacle = [[UIView alloc] initWithFrame:
                                CGRectMake(x, y, 7, 7)];
            obstacle.layer.cornerRadius =  obstacle.bounds.size.width / 2;
            obstacle.layer.masksToBounds = YES;
            obstacle.backgroundColor = [UIColor whiteColor];
            obstacle.layer.borderWidth = 1.5f;
            obstacle.layer.borderColor = [UIColor blackColor].CGColor;
            [self.obstacles addObject:obstacle];
            [self.view addSubview:obstacle];
            
            x += 60;
        }
        y += 60;
    }
    
    int squareY = self.view.bounds.size.height - 50;
    int squareX = 64;
    for (int i = 0; i < 5; i++) {
        UIView* square = [[UIView alloc] initWithFrame:
                          CGRectMake(squareX, squareY, 10, 50)];
        square.layer.cornerRadius =  0.5;
        square.layer.masksToBounds = YES;
        square.backgroundColor = [UIColor blackColor];
        [self.obstacles addObject:square];
        [self.view addSubview:square];
        
        squareX += 69;
    }
}

-(void) getLocation{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.distanceFilter = kCLLocationAccuracyBest;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; // 100 m
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations	{
    CLLocation* location = [locations lastObject];
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
   //NSLog(@"location %@",location);
    
    [self.locationManager stopUpdatingLocation];
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

- (IBAction)tapGesture:(id)sender {
    if (!self.isChipDropped) {
        int x = [sender locationInView:self.view].x;
        
        self.playerChip = [[UIView alloc] initWithFrame:
                              CGRectMake(x, 50, 33, 33)];
        self.playerChip.layer.cornerRadius = self.playerChip.bounds.size.width/2;
        self.playerChip.layer.masksToBounds = YES;
        self.playerChip.backgroundColor = [UIColor whiteColor];
        self.playerChip.layer.borderWidth = 1.5f;
        self.playerChip.layer.borderColor = [UIColor blackColor].CGColor;
        [self.view addSubview:self.playerChip];
        
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.playerChip]];
        [_animator addBehavior:gravityBehavior];
        
        _collision = [[UICollisionBehavior alloc] initWithItems:@[self.playerChip]];
        for (int i = 0; i < self.obstacles.count; i++) {
            [_collision addItem:((UIView*)[self.obstacles objectAtIndex:i])];
        }
        
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        [_animator addBehavior:_collision];
        
        UIDynamicItemBehavior *obstaclesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:self.obstacles];
        obstaclesBehavior.allowsRotation = NO;
        obstaclesBehavior.density = 100000.0;
        [_animator addBehavior:obstaclesBehavior];
        
        self.isChipDropped = YES;
    }
    
    // If we have dropped the chip and it has landed on the bottom - player move ends.
    else if(self.isChipDropped
            && [sender locationInView:self.view].x >= self.playerChip.frame.origin.x
            && [sender locationInView:self.view].x <= self.playerChip.frame.origin.x + self.playerChip.bounds.size.width
            &&[sender locationInView:self.view].y >= self.playerChip.frame.origin.y
            && [sender locationInView:self.view].y <= self.playerChip.frame.origin.y + self.playerChip.bounds.size.height
            && [sender locationInView:self.view].y > self.view.bounds.size.height - self.playerChip.bounds.size.height - 20){
        
        // Check where the chip has landed and anounce that the player in turn or the others have to drink;
        [self.playerChip removeFromSuperview];
        int x = [sender locationInView:self.view].x;
        int landingZone = x/ (floor(self.view.bounds.size.width) / 6);
        // Zones 0-6 will be the players. If it lands in the zone of the current player(this will be an int variable that holds the current player index in an array of players that comes from the previous page) - an alert to the others to drink their beverages.
        [self showAlertWithTitle:@"Player drinks his shot or Other players drink their shots" andMessage:@"Better luck next time :) or Good job!"];
        
        NSLog(@"Landing zone number: %d", landingZone);
        
        
        self.isChipDropped = NO;
        
        // Increase current player index with 1. When it becomes 6 - game over conditions - save in database.
        
    }
    // If we have dropped the chip and it becomes stuck - tap on it and it will start again from top
    else if(self.isChipDropped
            && [sender locationInView:self.view].x >= self.playerChip.frame.origin.x
            && [sender locationInView:self.view].x <= self.playerChip.frame.origin.x + self.playerChip.bounds.size.width
            &&[sender locationInView:self.view].y >= self.playerChip.frame.origin.y
            && [sender locationInView:self.view].y <= self.playerChip.frame.origin.y + self.playerChip.bounds.size.height){
        int x = [sender locationInView:self.view].x;
        
        [self.playerChip removeFromSuperview];
        
        self.playerChip = [[UIView alloc] initWithFrame:
                           CGRectMake(x, 50, 33, 33)];
        self.playerChip.layer.cornerRadius = self.playerChip.bounds.size.width/2;
        self.playerChip.layer.masksToBounds = YES;
        self.playerChip.backgroundColor = [UIColor whiteColor];
        self.playerChip.layer.borderWidth = 1.5f;
        self.playerChip.layer.borderColor = [UIColor blackColor].CGColor;
        [self.view addSubview:self.playerChip];
        
        
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
        UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.playerChip]];
        [_animator addBehavior:gravityBehavior];
        
        _collision = [[UICollisionBehavior alloc] initWithItems:@[self.playerChip]];
        for (int i = 0; i < self.obstacles.count; i++) {
            [_collision addItem:((UIView*)[self.obstacles objectAtIndex:i])];
        }
        
        _collision.translatesReferenceBoundsIntoBoundary = YES;
        [_animator addBehavior:_collision];
        
        UIDynamicItemBehavior *obstaclesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:self.obstacles];
        obstaclesBehavior.allowsRotation = NO;
        obstaclesBehavior.density = 100000.0;
        [_animator addBehavior:obstaclesBehavior];
    }
}

-(void)showAlertWithTitle: (NSString *) title andMessage: (NSString *) message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle: title
                                  message: message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Next player(based on the index) turn!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {}];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
