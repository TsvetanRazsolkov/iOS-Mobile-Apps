//
//  ViewController.m
//  Homework
//
//  Created by Tsvetan Razsolkov on 1/26/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "ViewController.h"

#import "DetailsViewController.h"

#import "AddNewPhoneViewController.h"

#import "Phone.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.phones) {
        self.phones = [[NSMutableArray alloc] init] ;
    }
    
    self.phoneTableView.dataSource = self;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    NSArray *cellIdentifiers = [NSArray arrayWithObjects: @"whiteCell", @"grayCell", nil];
    UITableViewCell *cell;
    
    if(cell == nil){
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiers[0]];
    }
    
    if (indexPath.row % 2 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiers[0]];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiers[1]];
    }
    
    Phone *currentPhone = self.phones[indexPath.row];
    
    cell.textLabel.text =[NSString stringWithFormat:@"%@ %@"
                          ,currentPhone.manufacturer, currentPhone.model];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.phones.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *whiteCellToDetails = @"whiteCellToDetailsSegue";
    NSString *grayCellToDetails = @"grayCellToDetailsSegue";
    NSString *toAddNewPhone = @"toAddNewPhone";
    Phone *selectedPhone;
    if ([segue.identifier isEqualToString:whiteCellToDetails] || [segue.identifier isEqualToString:grayCellToDetails]) {
        NSIndexPath *indexPath = [self.phoneTableView indexPathForCell:sender];
        selectedPhone = self.phones[indexPath.row];
        DetailsViewController* toVC = segue.destinationViewController;
        toVC.phone = selectedPhone;        
    }
    if ([segue.identifier isEqualToString:toAddNewPhone]) {
        AddNewPhoneViewController* toVC = segue.destinationViewController;
        toVC.phones = self.phones;
    }
}

//-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end