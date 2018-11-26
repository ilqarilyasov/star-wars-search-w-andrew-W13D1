//
//  IIIPersonSearchTableViewController.m
//  Star Wars Search
//
//  Created by Ilgar Ilyasov on 11/26/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

#import "IIIPersonSearchTableViewController.h"
#import "IIIPerson.h"
#import "Star_Wars_Search-Swift.h"

@interface IIIPersonSearchTableViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) NSArray<IIIPerson *> *people;

@end

@implementation IIIPersonSearchTableViewController

// MARK: - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    
    IIIPerson *person = self.people[indexPath.row];
    cell.person = person;
    
    return cell;
}

// MARK: - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    PersonController *pc = [PersonController sharedController];
    [pc searchForPeopleWithSearchTerm:searchBar.text completionBlock:^(NSArray<IIIPerson *> * people, NSError * error) {
        if (error) {
            NSLog(@"Error search for %@: %@", searchBar.text, error);
        }
        self.people = people;
    }];
}


// MARK: - Properties

- (void)setPeople:(NSArray<IIIPerson *> *)people
{
    _people = [people copy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

@end
