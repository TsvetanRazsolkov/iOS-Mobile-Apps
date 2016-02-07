//
//  MainPageViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "MainPageViewController.h"
#import "StartGameViewController.h"
#import "TRCoreData.h"
#import "Drink.h"
#import "Game.h"
#import "Player.h"
//#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVAudioSession.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface MainPageViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnPlayWithTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnPlayWithSix;
@property (weak, nonatomic) IBOutlet UIButton *btnLatest;

@property (strong, nonatomic) TRCoreData* dataHelper;

@property (strong, nonatomic) AVAudioPlayer* audioPlayer;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    self.title = @"Main Page";
    
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Music-loop-120-bpm" ofType:@"mp3"]];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
//        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
//        [[AVAudioSession sharedInstance] setActive: YES error: nil];
//        [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
        self.audioPlayer.numberOfLoops = -1; //Infinite
        [self.audioPlayer play];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"mainPageBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    self.btnPlayWithSix.layer.cornerRadius = 20;
    self.btnPlayWithTwo.layer.cornerRadius = 20;
    self.btnLatest.layer.cornerRadius=20;
    // Do any additional setup after loading the view.
    
    // this is initial seeding just for testing
    //[self seedDatabase];
}

// will be deleted, it is just for test seeding
-(void) seedDatabase{
    self.dataHelper = [[TRCoreData alloc] init];
    [self.dataHelper setupCoreData];
    
    for (int j=0; j < 6; j++) {
        Game* game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:self.dataHelper.context];
        
        for (int i = 0; i < 6; i++) {
            Player* player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:self.dataHelper.context];
            [player setValue:[NSString stringWithFormat:@"Pesho %d", i] forKey:(@"name")];
            
            Drink* drink = [NSEntityDescription insertNewObjectForEntityForName:@"Drink" inManagedObjectContext:self.dataHelper.context];
            [drink setValue:[NSString stringWithFormat:@"Bira %d", i] forKey:(@"name")];
            [player addDrinksObject:drink];
            [game addDrinksObject:drink];
            [game addPlayersObject:player];
        }
        
        [game setValue:@42.6508509 forKey:(@"latitude")];
        [game setValue:@23.3772423 forKey:(@"longitude")];
        [game setValue:[NSDate date] forKey:@"playedOn"];
        [game setValue:@0 forKey:@"type"];
        
        [self.dataHelper.context insertObject:game];
    }
    
    [self.dataHelper saveContext];
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
            GameModel* game = [[GameModel alloc] initWithType:0 latitude:0.0 andLongitude:0.0];
            toVC.game = game;
        }
}


@end
