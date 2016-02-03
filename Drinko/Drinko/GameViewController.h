//
//  GameViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/1/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreLocation/CLLocationManagerDelegate.h>

@interface GameViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic,retain) CLLocationManager *locationManager;

@end
