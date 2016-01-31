//
//  DetailsViewController.h
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/31/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *playersCollectionView;

@end
