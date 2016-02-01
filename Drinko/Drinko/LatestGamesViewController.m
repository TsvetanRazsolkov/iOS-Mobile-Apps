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

@interface LatestGamesViewController ()

@end

@implementation LatestGamesViewController

NSArray* arr;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.latestGamesTableView.delegate = self;
    self.latestGamesTableView.dataSource = self;
    
    arr = [NSArray arrayWithObjects:@"Pesho",@"Gosho",@"Stamat",@"Mariika", @"Doncho", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", @"Andy", @"Pandy", nil];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"mainPageBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    // Do any additional setup after loading the view from its nib.
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
    
    cell.gameInfoImageView.image = [UIImage imageNamed:@"defaultGameInfoImage"];
    
    cell.gameInfoPlayersLabel.text = [arr objectAtIndex:indexPath.row];
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
    
    detailsVC.latitude = 39.281516;
    detailsVC.longitude = -76.580806;
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
