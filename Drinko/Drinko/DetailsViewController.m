//
//  DetailsViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/31/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "DetailsViewController.h"
#import "PlayersCollectionViewCell.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

NSArray* playerNames;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playersCollectionView.dataSource = self;
    self.playersCollectionView.delegate = self;
    
    playerNames = [NSArray arrayWithObjects:@"Pesho",@"Gosho",@"Stamat",@"Mariika", @"Doncho", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", nil];

    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"commonBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
 // will return the number of cells in the array of player names we have for the specified game
    return playerNames.count;
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
    
    static BOOL nibMyCellloaded = NO;
    if(!nibMyCellloaded)
    {
        UINib *nib = [UINib nibWithNibName:@"PlayersCollectionViewCell" bundle: nil];
        [self.playersCollectionView registerNib:nib forCellWithReuseIdentifier:customCellIdentifier];
        nibMyCellloaded = YES;
    }
    
    PlayersCollectionViewCell *cell = (PlayersCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:customCellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[playerIconsNames objectAtIndex:indexPath.row % 6]];
    
    cell.playerNameLabel.text = [playerNames objectAtIndex:indexPath.row];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
