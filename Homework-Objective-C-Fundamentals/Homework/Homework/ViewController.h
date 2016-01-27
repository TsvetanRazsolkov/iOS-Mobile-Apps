//
//  ViewController.h
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *phoneTableView;
@property (strong, nonatomic) NSMutableArray *phones;

@end

