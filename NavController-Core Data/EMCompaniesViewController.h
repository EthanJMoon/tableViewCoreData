//
//  EMViewController.h
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMAppDelegate.h"
#import "EMProductsViewController.h"
@class EMProductsViewController;

@class EMAppDelegate;

@interface EMCompaniesViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) EMProductsViewController *productsViewController;
@property (nonatomic,strong) EMAppDelegate* delegate;
@property (nonatomic,strong) NSMutableArray* arrayCompanies;

@end
