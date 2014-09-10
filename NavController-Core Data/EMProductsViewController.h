//
//  EMProductsViewController.h
//  NavController-Core Data
//
//  Created by Ethan on 4/17/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "Company.h"
#import "EMAppDelegate.h"
@class EMAppDelegate;

@interface EMProductsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain)Company *specificCompany;
@property (nonatomic, retain)NSMutableArray *prodArray;
@property (nonatomic,strong) EMAppDelegate* delegate;
@property (nonatomic,strong) NSMutableArray* arrayCompanies;
@property int indexNumber;


@end
