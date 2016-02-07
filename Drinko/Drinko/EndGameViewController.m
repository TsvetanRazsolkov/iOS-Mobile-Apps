//
//  EndGameViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 2/6/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "EndGameViewController.h"
#import "Game.h"
#import "Player.h"
#import "Drink.h"

@implementation EndGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES];
    self.title = @"End game page";
    
    self.dataHelper = [[TRCoreData alloc] init];
    [self.dataHelper setupCoreData];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"commonBackground.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self showAlertWithTitle:@"Error" andMessage:@"Device has no camera."];}
    // Do any additional setup after loading the view from its nib.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    self.game.image = UIImagePNGRepresentation(chosenImage);
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (IBAction)takePhoto:(id)sender {
    @try {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
    }
    @catch (NSException *exception) {
        [self showAlertWithTitle:@"Error" andMessage:@"Device has no camera."];
    }
}

-(void)showAlertWithTitle: (NSString *) title andMessage: (NSString *) message{
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle: title
                                  message: message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                {}];
    
    [alert addAction:yesButton];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    Game* game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:self.dataHelper.context];
    
    
    for (int i = 0; i < self.game.drinks.count; i++) {
        Drink* drink = [NSEntityDescription insertNewObjectForEntityForName:@"Drink" inManagedObjectContext:self.dataHelper.context];
        [drink setValue:[self.game.drinks[i] name] forKey:(@"name")];
        
        [game addDrinksObject:drink];
    }
    
    for (int i = 0; i < self.game.players.count; i++) {
        Player* player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:self.dataHelper.context];
        [player setValue:[self.game.players[i] name] forKey:(@"name")];
        
        for (int j = 0; j < [self.game.players[i] drinks].count; j++) {
            Drink* drink = [NSEntityDescription insertNewObjectForEntityForName:@"Drink" inManagedObjectContext:self.dataHelper.context];
            [drink setValue:[[self.game.players[i] drinks][j] name] forKey:(@"name")];
            
            [player addDrinksObject:drink];
        }
        [game addPlayersObject:player];        
    }
    
    [game setValue:[NSNumber numberWithDouble:self.game.latitude] forKey:(@"latitude")];
    [game setValue:[NSNumber numberWithDouble:self.game.longitude] forKey:(@"longitude")];
    [game setValue:[NSDate date] forKey:@"playedOn"];
    //[game setValue:self.game.image forKey:@"image"];
    [game setValue: UIImagePNGRepresentation([UIImage imageNamed:@"donkeybeer.jpg"]) forKey:@"image"];
    [game setValue:[NSNumber numberWithInt:self.game.type ] forKey:@"type"];
    
    [self.dataHelper.context insertObject:game];    
    
    [self.dataHelper saveContext];
}
@end
