//
//  EMAppDelegate.h
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMCompaniesViewController.h"
#import "EMCoreDataManager.h"

@interface EMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) NSMutableArray* companiesArray;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
