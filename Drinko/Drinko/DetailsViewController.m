//
//  DetailsViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/31/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "DetailsViewController.h"
#import "PlayersCollectionViewCell.h"
#import "Player.h"

#define METERS_PER_MILE 1609.344


@interface DetailsViewController ()

@end

@implementation DetailsViewController

NSMutableArray* players;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Game Details Page";
    
    players = [[NSMutableArray alloc]init];
    for (Player* player in self.game.players) {
        [players addObject:player];
    }
    
    self.playersCollectionView.dataSource = self;
    self.playersCollectionView.delegate = self;
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"commonBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    if (self.game.image == nil) {
        self.imageView.image = [UIImage imageNamed:@"defaultGameInfoImage"];
    }
    else{
        self.imageView.image = [UIImage imageWithData:self.game.image];
    }
    
    UINib *nib = [UINib nibWithNibName:@"PlayersCollectionViewCell" bundle: nil];
    [self.playersCollectionView registerNib:nib forCellWithReuseIdentifier:@"playerCustomCell"];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    if ([self.game.latitude doubleValue] == 0.0) {
        zoomLocation.latitude = 42.650851;
        zoomLocation.longitude = 23.377242;
    }
    else{
    zoomLocation.latitude = [self.game.latitude doubleValue];
    zoomLocation.longitude= [self.game.longitude doubleValue];
    }
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.1*METERS_PER_MILE, 0.1*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:zoomLocation];
    [annotation setTitle:@"Played here!"];
    [self.mapView addAnnotation:annotation];
    [self.mapView selectAnnotation:annotation animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 // will return the number of cells in the array of player names we have for the specified game
    return players.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // this cell may be custom - with a random image inside of a drunk face icon :)
    
    static NSString *customCellIdentifier = @"playerCustomCell";
    
    NSArray* playerIconsNames = [NSArray arrayWithObjects:@"playerIcon1.png",@"playerIcon2.png",@"playerIcon3.png",@"playerIcon4.png", @"playerIcon5.png", @"playerIcon6.png", nil];
    
    NSArray* backgroundColours = [[NSArray alloc] initWithObjects:
                                  [UIColor colorWithRed:245.0f/255.0f                                                                                                                                                                       green:229.0f/255.0f                                                                                                                                                                        blue:44.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor colorWithRed:94.0f/255.0f                                                                                                                                                                       green:91.0f/255.0f                                                                                                                                                                        blue:230.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor colorWithRed:224.0f/255.0f                                                                                                                                                                       green:0.0f/255.0f                                                                                                                                                                        blue:37.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor blackColor],
                                  [UIColor colorWithRed:23.0f/255.0f                                                                                                                                                                       green:120.0f/255.0f                                                                                                                                                                        blue:49.0f/255.0f                                                                                                                                                                       alpha:1.0f],
                                  [UIColor whiteColor],nil];
    
    NSArray* colours = [[NSArray alloc] initWithObjects:[UIColor blackColor],  [UIColor blackColor], [UIColor whiteColor],[UIColor whiteColor],[UIColor blackColor],[UIColor blackColor],nil];
    
    PlayersCollectionViewCell *cell = (PlayersCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:customCellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[playerIconsNames objectAtIndex:indexPath.row % 6]];
    
    cell.playerNameLabel.text = [[players objectAtIndex:indexPath.row] name];
    cell.playerNameLabel.textColor = colours[indexPath.row % 6];
    cell.backgroundColor = [backgroundColours objectAtIndex:indexPath.row%6];
//    cell.layer.cornerRadius = 20; // 37 for rounded corners;
//    cell.layer.masksToBounds = YES;
    cell.tag = indexPath.row;
    
    return cell;
    
//    UICollectionViewCell *cell = (UICollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"playerCollectionCell" forIndexPath:indexPath];
//    
//    UIGraphicsBeginImageContext(cell.frame.size);
//    [[UIImage imageNamed:@"defaultGameInfoImage.png"] drawInRect:cell.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    cell.backgroundColor = [UIColor colorWithPatternImage:image];
//
//    
//    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Player *player = [players objectAtIndex:indexPath.row];
    
    [self showAlertWithTitle:[NSString stringWithFormat:@"%@", [player description]] andMessage:@"It was difficult."];
}

-(void)showAlertWithTitle: (NSString *) title andMessage: (NSString *) message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle: title
                                  message: message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Nice!"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {}];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
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
