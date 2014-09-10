//
//  EMProductsViewController.m
//  NavController-Core Data
//
//  Created by Ethan on 4/17/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import "EMProductsViewController.h"

@interface EMProductsViewController ()

@end

@implementation EMProductsViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.delegate = (EMAppDelegate*)[[UIApplication sharedApplication]delegate];
    self.arrayCompanies = self.delegate.companiesArray;
    self.specificCompany = [self.arrayCompanies objectAtIndex:self.indexNumber];
    self.prodArray =  [[NSMutableArray alloc] initWithArray:[self.specificCompany.newRelationship allObjects]];
    NSLog(@"Number of products are %i \n",[self.prodArray count ]);
    self.title = [self.specificCompany name];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Selected row # %i",indexPath.row);
}

#pragma mark tableViewDataSource delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Product *tempProd = [self.prodArray objectAtIndex:indexPath.row];
    cell.textLabel.text = tempProd.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.prodArray count];
}

-(void)setEditing:(BOOL)editing animated:(BOOL) animated {
    if (editing){
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:YES animated:YES];
    }
    else {
        [super setEditing:editing animated:animated];
        [self.tableView setEditing:NO animated:YES];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tv editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void) tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle) editing forRowAtIndexPath:(NSIndexPath *)indexPath {
    if( editing == UITableViewCellEditingStyleDelete ) {
        
        [[[EMCoreDataManager coreDataManager]init] deleteCompany:[self.prodArray objectAtIndex:indexPath.row]];
        [self.prodArray removeObjectAtIndex:indexPath.row];
        [tv deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]withRowAnimation:UITableViewRowAnimationLeft];
    }
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
