//
//  StartGameViewController.m
//  Drinko
//
//  Created by Tsvetan Razsolkov on 1/30/16.
//  Copyright © 2016 Tsvetan Razsolkov. All rights reserved.
//

#import "StartGameViewController.h"
#import "PlayerModel.h"
#import "DrinkModel.h"
#import "GameViewController.h"
#import "TRCoreData.h"
#import "Drink.h"
#import "Player.h"
//#import "APContact.h"
//#import "APAddressBook.h"
#import <AddressBook/AddressBook.h>
#import <Contacts/Contacts.h>

@import AddressBook;

@interface StartGameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlayerName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDrink;
@property (weak, nonatomic) IBOutlet UITextView *textViewPlayerDrinkList;
- (IBAction)btnAddPlayerAndDrink:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCloseAutocomplete;
- (IBAction)hideAutocomplete:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnCloseDrinksAutocomplete;
- (IBAction)hideDrinksAutocomplete:(id)sender;

@property (strong, nonatomic) NSMutableArray* autocompletePlayerNames;
@property (strong, nonatomic) NSMutableSet* allPlayerNames;
@property (strong, nonatomic) NSMutableSet* allDrinks;
@property (strong, nonatomic) NSMutableArray* autocompletelDrinkNames;
@property (weak, nonatomic) IBOutlet UITableView *autocompleteTableView;
@property (weak, nonatomic) IBOutlet UITableView *autocompleteDrinksTableView;

@property (strong, nonatomic) TRCoreData* dataHelper;

@end

@implementation StartGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Add Players and Drinks";
    
    // will come from core data and phone contacts in a method loadAutocompleteData
    self.allPlayerNames = [[NSMutableSet alloc] init];
    self.autocompletePlayerNames = [[NSMutableArray alloc] init];
    self.allDrinks = [[NSMutableSet alloc] init];
    self.autocompletelDrinkNames = [[NSMutableArray alloc] init];
    
    [self loadAutocompleteData];
    
    self.autocompleteTableView.delegate = self;
    self.autocompleteTableView.dataSource = self;
    self.autocompleteTableView.hidden = YES;
    
    self.autocompleteDrinksTableView.delegate = self;
    self.autocompleteDrinksTableView.dataSource = self;
    self.autocompleteDrinksTableView.hidden = YES;
    
    self.btnCloseAutocomplete.hidden = YES;
    self.btnCloseDrinksAutocomplete.hidden = YES;
    
    self.textFieldPlayerName.delegate = self;
    self.textFieldDrink.delegate = self;
    
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

-(void) loadAutocompleteData{
    // names from Contacts API
    if ([CNContactStore class]) {
        //ios9 or later
        CNEntityType entityType = CNEntityTypeContacts;
        if( [CNContactStore authorizationStatusForEntityType:entityType] == CNAuthorizationStatusNotDetermined)
        {
            CNContactStore * contactStore = [[CNContactStore alloc] init];
            [contactStore requestAccessForEntityType:entityType completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if(granted){
                    [self getAllContact];
                }
            }];
        }
        else if( [CNContactStore authorizationStatusForEntityType:entityType]== CNAuthorizationStatusAuthorized)
        {
            [self getAllContact];
        }
    }
    
    // names from Core Data
    self.dataHelper = [[TRCoreData alloc] init];
    [self.dataHelper setupCoreData];
    
    NSFetchRequest *playerRequest = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    
    NSArray* playersArr = [self.dataHelper.context executeFetchRequest:playerRequest error:nil];
    for (int i = 0; i < playersArr.count; i++) {
        [self.allPlayerNames addObject:[playersArr[i] name]];
    }
    
    NSFetchRequest *drinkRequest = [NSFetchRequest fetchRequestWithEntityName:@"Drink"];
    
    NSArray* drinksArr = [self.dataHelper.context executeFetchRequest:drinkRequest error:nil];
    for (int i = 0; i < drinksArr.count; i++) {
        [self.allDrinks addObject:[drinksArr[i] name]];
    }
}

-(void)getAllContact
{
    if([CNContactStore class])
    {
        //iOS 9 or later
        NSError* contactError;
        CNContactStore* addressBook = [[CNContactStore alloc]init];
        [addressBook containersMatchingPredicate:[CNContainer predicateForContainersWithIdentifiers: @[addressBook.defaultContainerIdentifier]] error:&contactError];
        NSArray * keysToFetch =@[CNContactEmailAddressesKey, CNContactPhoneNumbersKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPostalAddressesKey];
        CNContactFetchRequest * request = [[CNContactFetchRequest alloc]initWithKeysToFetch:keysToFetch];
        BOOL success = [addressBook enumerateContactsWithFetchRequest:request error:&contactError usingBlock:^(CNContact * __nonnull contact, BOOL * __nonnull stop){
            [self parseContactNameFromContact:contact];
        }];
    }
}

- (void)parseContactNameFromContact :(CNContact* )contact
{
    NSString * firstName =  contact.givenName;
    [self.allPlayerNames addObject:firstName];
}

- (IBAction)btnAddPlayerAndDrink:(id)sender {
    
    if ([self.textFieldPlayerName.text length] <2 || [self.textFieldPlayerName.text length] > 20 ) {
        [self showAlertWithTitle:@"Invalid player name" andMessage:@"Player name must be between 2 and 20 symbols"];
        
        self.textFieldDrink.text = @"";
        self.textFieldPlayerName.text = @"";
        return;
    }
    if ([self.textFieldDrink.text length] < 3 || [self.textFieldDrink.text length] > 15 ) {
        [self showAlertWithTitle:@"Invalid drink" andMessage:@"Drink name must be between 3 and 15 symbols"];
        
        self.textFieldDrink.text = @"";
        self.textFieldPlayerName.text = @"";
        return;
    }
    
    if ([self.game.players count] == 6) {
        [self showAlertWithTitle:@"No more players allowed." andMessage:@"Game with 6 players can have no more than 6 players."];
        
        self.textFieldDrink.text = @"";
        self.textFieldPlayerName.text = @"";
        return;
    }
    
    PlayerModel* player = [[PlayerModel alloc] initWithName:self.textFieldPlayerName.text];
    DrinkModel* drink = [[DrinkModel alloc] initWithName:self.textFieldDrink.text];
    [player.drinks addObject:drink];
    [self.game.players addObject:player];
    [self.game.drinks addObject:drink];
    [self.allPlayerNames addObject:player.name];
    [self.allDrinks addObject:drink.name];
    
    NSString* playerDrink = [NSString stringWithFormat:@"%@ - %@", player.name, drink.name ];
    
    NSString* previousList = self.textViewPlayerDrinkList.text;
    NSString* newList = [NSString stringWithFormat:@"%@ \n %@", previousList, playerDrink];
    self.textViewPlayerDrinkList.text = newList;
    self.textViewPlayerDrinkList.font = [UIFont fontWithName:@"Arial" size:25];
    self.textViewPlayerDrinkList.textAlignment = NSTextAlignmentCenter; 
    
    self.textFieldDrink.text = @"";
    self.textFieldPlayerName.text = @"";
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

#pragma mark Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if ([self.game.players count] != 6) {
        [self showAlertWithTitle:@"Game must have 6 players." andMessage:@"Game with 6 players can have no less than 6 players."];
        
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GameViewController* toVC = segue.destinationViewController;
    toVC.game = self.game;
}

#pragma mark Autocomplete stuff:

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger) section {
    if (tableView == self.autocompleteTableView) {
        return self.autocompletePlayerNames.count;
    }
    else {
        return self.autocompletelDrinkNames.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    static NSString *AutoCompleteRowIdentifier = @"AutoCompleteRowIdentifier";
    cell = [tableView dequeueReusableCellWithIdentifier:AutoCompleteRowIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AutoCompleteRowIdentifier];
    }
    if (tableView == self.autocompleteTableView) {
        cell.textLabel.text = [self.autocompletePlayerNames objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:25];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    else{
        cell.textLabel.text = [self.autocompletelDrinkNames objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Arial" size:25];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(tableView == self.autocompleteTableView){
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    self.textFieldPlayerName.text = selectedCell.textLabel.text;
        
    [self fillPlayerPressed];
    }
    else{
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
        self.textFieldDrink.text = selectedCell.textLabel.text;
        [self fillDrinkPressed];
    }
    
}

- (IBAction)fillPlayerPressed {
    
    [self.textFieldPlayerName resignFirstResponder];
    self.autocompleteTableView.hidden = YES;
    self.btnCloseAutocomplete.hidden = YES;
    
    if (![self.allPlayerNames containsObject:self.textFieldPlayerName.text]) {
        [self.allPlayerNames addObject:self.textFieldPlayerName.text];
    }
}

- (IBAction)fillDrinkPressed {
    
    [self.textFieldDrink resignFirstResponder];
    self.autocompleteDrinksTableView.hidden = YES;
    self.btnCloseDrinksAutocomplete.hidden = YES;
    
    if (![self.allDrinks containsObject:self.textFieldDrink.text]) {
        [self.allDrinks addObject:self.textFieldDrink.text];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.textFieldPlayerName) {
        self.autocompleteTableView.hidden = NO;
        self.btnCloseAutocomplete.hidden = NO;
        
        NSString *substring = [NSString stringWithString:textField.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompletePlayerNameEntriesWithSubstring: substring];
        return YES;
    }
    else{
        self.autocompleteDrinksTableView.hidden = NO;
        self.btnCloseDrinksAutocomplete.hidden = NO;
        
        NSString *substring = [NSString stringWithString:textField.text];
        substring = [substring stringByReplacingCharactersInRange:range withString:string];
        [self searchAutocompleteDrinkEntriesWithSubstring: substring];
        return YES;

    }
    
}
- (void)searchAutocompletePlayerNameEntriesWithSubstring:(NSString *)substring {
    
    [self.autocompletePlayerNames removeAllObjects];
    for(NSString *name in self.allPlayerNames) {
        NSRange substringRange = [name rangeOfString:substring options:NSCaseInsensitiveSearch];
        if (substringRange.location == 0) {
            [self.autocompletePlayerNames addObject:name];
        }
    }
    [self.autocompleteTableView reloadData];
}

- (void)searchAutocompleteDrinkEntriesWithSubstring:(NSString *)substring {
    
    [self.autocompletelDrinkNames removeAllObjects];
    for(NSString *name in self.allDrinks) {
        NSRange substringRange = [name rangeOfString:substring options:NSCaseInsensitiveSearch];
        if (substringRange.location == 0) {
            [self.autocompletelDrinkNames addObject:name];
        }
    }
    [self.autocompleteDrinksTableView reloadData];
}


- (IBAction)hideAutocomplete:(id)sender {
    self.autocompleteTableView.hidden = YES;
    self.btnCloseAutocomplete.hidden = YES;
}
- (IBAction)hideDrinksAutocomplete:(id)sender {
    self.autocompleteDrinksTableView.hidden = YES;
    self.btnCloseDrinksAutocomplete.hidden = YES;
}
@end
