//
//  LatestGamesViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "LatestGamesViewController.h"

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
    
    NSArray* cellIdentifiers = @[@"yellowCell", @"blueCell", @"redCell", @"blackCell", @"greenCell", @"whiteCell" ];
    NSArray* colours = [[NSArray alloc] initWithObjects:[UIColor blackColor],  [UIColor blackColor], [UIColor whiteColor],[UIColor whiteColor],[UIColor blackColor],[UIColor blackColor],nil];
    
    
    NSString* cellIdentifier = cellIdentifiers[indexPath.row%6];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = arr[indexPath.row];
    cell.textLabel.textColor = colours[indexPath.row % 6];
    cell.layer.cornerRadius = 20; // 37 for rounded corners;
    cell.layer.masksToBounds = YES;
    cell.tag = indexPath.row;
    
    return cell;
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
