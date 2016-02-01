//
//  DetailsViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/31/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailsViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>

@property float latitude;
@property float longitude;

@property (weak, nonatomic) IBOutlet UICollectionView *playersCollectionView;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *playedOnLabel;

@end
