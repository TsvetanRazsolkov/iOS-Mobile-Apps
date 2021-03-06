//
//  LatestGamesViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "LatestGamesViewController.h"
#import "GameInfoTableViewCell.h"
#import "DetailsViewController.h"
#import "TRCoreData.h"
#import "Game.h"
#import "Player.h"
#import "Drink.h"

@interface LatestGamesViewController ()

@property (strong, nonatomic) TRCoreData* dataHelper;

@end

@implementation LatestGamesViewController

NSArray* arr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Latest Games";
    
    self.latestGamesTableView.delegate = self;
    self.latestGamesTableView.dataSource = self;
    
    [self loadData];
    
//    arr = [NSArray arrayWithObjects:@"Pesho",@"Gosho",@"Stamat",@"Mariika", @"Doncho", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", nil];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"mainPageBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    // Do any additional setup after loading the view from its nib.
}

-(void) loadData{
    self.dataHelper = [[TRCoreData alloc] init];
    [self.dataHelper setupCoreData];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    NSSortDescriptor *sort =
    [NSSortDescriptor sortDescriptorWithKey:@"playedOn" ascending:NO];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    [request setFetchLimit:10];
    
    arr = [self.dataHelper.context executeFetchRequest:request error:nil];
    
    NSLog(@"poshka");  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    static NSString *customCellIdentifier = @"gameInfoCustomCell";
    
    NSArray* backgroundColours = [[NSArray alloc] initWithObjects:
                                  [UIColor colorWithRed:245.0f/255.0f                                                                                                                                                                       green:229.0f/255.0f                                                                                                                                                                        blue:44.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor colorWithRed:94.0f/255.0f                                                                                                                                                                       green:91.0f/255.0f                                                                                                                                                                        blue:230.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor colorWithRed:224.0f/255.0f                                                                                                                                                                       green:0.0f/255.0f                                                                                                                                                                        blue:37.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor blackColor],
                                  [UIColor colorWithRed:23.0f/255.0f                                                                                                                                                                       green:120.0f/255.0f                                                                                                                                                                        blue:49.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor whiteColor],nil];
    
    NSArray* colours = [[NSArray alloc] initWithObjects:[UIColor blackColor],  [UIColor blackColor], [UIColor whiteColor],[UIColor whiteColor],[UIColor blackColor],[UIColor blackColor],nil];
    
    GameInfoTableViewCell *cell = (GameInfoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:customCellIdentifier];
    
    if (cell == nil)
        
    {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"GameInfoTableViewCell" owner:self options:nil];
        
        cell = [nibArray objectAtIndex:0];
        
    }
    
    if ([[arr objectAtIndex:indexPath.row] image] == nil) {
        cell.gameInfoImageView.image = [UIImage imageNamed:@"defaultGameInfoImage"];
    }
    else{
        // TODO: make UIImage from NSData
        NSData* data = [[arr objectAtIndex:indexPath.row] image];
        UIImage* imageToUse = [UIImage imageWithData:data];
        cell.gameInfoImageView.image = imageToUse;
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *datePlayed = [dateFormatter stringFromDate:[[arr objectAtIndex:indexPath.row] playedOn]];
    cell.gameInfoPlayersLabel.text = datePlayed;
    cell.gameInfoPlayersLabel.textColor = colours[indexPath.row % 6];
    cell.backgroundColor = [backgroundColours objectAtIndex:indexPath.row%6];
    cell.layer.cornerRadius = 20; // 37 for rounded corners;
    cell.layer.masksToBounds = YES;
    cell.tag = indexPath.row;
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *storyBoardId = @"details view";
    
    DetailsViewController *detailsVC =
    [self.storyboard instantiateViewControllerWithIdentifier:storyBoardId];
    
    //         AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    //    appDelegate.window.rootViewController = detailsVC;
    
    detailsVC.game = [arr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailsVC animated:YES];
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
