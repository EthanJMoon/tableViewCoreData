//
//  EMViewController.m
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import "EMCompaniesViewController.h"

@interface EMCompaniesViewController ()

@end

@implementation EMCompaniesViewController

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
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.title = @"Device Companies";
    self.delegate = (EMAppDelegate*)[[UIApplication sharedApplication]delegate];
    self.arrayCompanies = self.delegate.companiesArray;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.productsViewController = [[EMProductsViewController alloc]initWithNibName:@"EMProductsViewController" bundle:nil];
    self.productsViewController.specificCompany = [self.arrayCompanies objectAtIndex:indexPath.row];
    self.productsViewController.indexNumber = indexPath.row;
    NSLog(@"Selected Company: %@\n",self.productsViewController.specificCompany.name);
    [self.navigationController pushViewController:self.productsViewController animated:YES];
}

#pragma mark tableViewDataSource delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Company *tempComp = [self.arrayCompanies objectAtIndex:indexPath.row];
    cell.textLabel.text = tempComp.name;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayCompanies count];
    
}


- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
