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
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Play Page";
    [self getLocation];
    
    
    
    // Do any additional setup after loading the view.
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
    NSLog(@"location %@",location);
    
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

@end
