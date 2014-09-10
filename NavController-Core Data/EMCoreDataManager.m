//
//  EMCoreDataManager.m
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#define company @"Company"
#define product @"Product"
#import "EMCoreDataManager.h"

@interface  EMCoreDataManager ()

@end

@implementation EMCoreDataManager

static EMCoreDataManager *manager;
EMAppDelegate* _delegate;
NSMutableArray* _companies;


+(EMCoreDataManager*)coreDataManager{
    if (manager == nil)
    {
        manager = [[EMCoreDataManager alloc] init];
    }
    return manager;
}


-(id)init{
    self = [super init];
    _delegate = (EMAppDelegate*)[[UIApplication sharedApplication]delegate];
    NSFetchRequest *companyRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *companyEntity = [NSEntityDescription entityForName:company inManagedObjectContext:_delegate.managedObjectContext];
    [companyRequest setEntity:companyEntity];
    NSError *errorFetch = nil;
    NSArray *companyArray = [_delegate.managedObjectContext executeFetchRequest:companyRequest error:&errorFetch];
    
    if (companyArray == nil || companyArray.count == 0){
    Company *apple = [NSEntityDescription insertNewObjectForEntityForName:company inManagedObjectContext:_delegate.managedObjectContext];
    apple.name = @"Apple";
    apple.image = [NSData dataWithContentsOfFile:@"Apple-logo-small.png"];
    apple.stockSymbol = @"AAPL";
    Company *samsung = [NSEntityDescription insertNewObjectForEntityForName:company inManagedObjectContext:_delegate.managedObjectContext];
    samsung.name = @"Samsung";
    samsung.image = [NSData dataWithContentsOfFile:@"logo_Samsung_small.gif"];
    samsung.stockSymbol = @"005930.ks";
    Company *htc = [NSEntityDescription insertNewObjectForEntityForName:company inManagedObjectContext:_delegate.managedObjectContext];
    htc.name = @"HTC";
    htc.image = [NSData dataWithContentsOfFile:@"htc-logo.gif"];
    htc.stockSymbol = @"2498.tw";
    Company *google = [NSEntityDescription insertNewObjectForEntityForName:company inManagedObjectContext:_delegate.managedObjectContext];
    google.name = @"Google";
    google.image = [NSData dataWithContentsOfFile:@"htc-logo.gif"];
    google.stockSymbol = @"GOOG";
    Product *iPad = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    iPad.name = @"iPad";
    iPad.url = @"";
    Product *iPod = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    iPod.name = @"iPod";
    iPod.url = @"";
    Product *iPhone = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    iPhone.name = @"iPhone";
    iPhone.url = @"";
    Product *galaxy_s5 = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    galaxy_s5.name = @"Galaxy S5";
    galaxy_s5.url = @"";
    Product *galaxy_note = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    galaxy_note.name = @"Galaxy Note";
    galaxy_note.url = @"";
    Product *galaxy_tab = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    galaxy_tab.name = @"Galaxy Tab";
    galaxy_tab.url = @"";
    Product *htc_one = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    htc_one.name = @"HTC One";
    htc_one.url = @"";
    Product *htc_evo = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    htc_evo.name = @"HTC Evo";
    htc_evo.url = @"";
    Product *htc_desire = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    htc_desire.name = @"HTC Desire";
    htc_desire.url = @"";
    Product *htc_droid = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    htc_droid.name = @"HTC Droid";
    htc_droid.url = @"";
    Product *moto_x = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    moto_x.name = @"Moto X";
    moto_x.url = @"";
    Product *droid_maxx = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    droid_maxx.name = @"Droid Maxx";
    droid_maxx.url = @"";
    Product *droid_ultra = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    droid_ultra.name = @"Droid Ultra";
    droid_ultra.url = @"";
    Product *droid_razr_x = [NSEntityDescription insertNewObjectForEntityForName:product inManagedObjectContext:_delegate.managedObjectContext];
    droid_razr_x.name = @"Droid Razr X";
    droid_razr_x.url = @"";
    
    [apple addNewRelationship:[NSSet setWithObjects:iPad,iPhone,iPod, nil]];
    [samsung addNewRelationship:[NSSet setWithObjects:galaxy_tab,galaxy_s5,galaxy_note, nil]];
    [htc addNewRelationship:[NSSet setWithObjects:htc_desire,htc_droid,htc_evo,htc_one, nil]];
    [google addNewRelationship:[NSSet setWithObjects:moto_x,droid_maxx,droid_razr_x,droid_ultra, nil]];
    
    [_delegate saveContext];
    
    _companies = [[NSMutableArray alloc]initWithObjects:apple,samsung,htc,google, nil];
    }
    else{
        _companies = [[NSMutableArray alloc]init];
        for (Company *com in companyArray)
        {
            [_companies addObject:com];
        }
    }
    return self;
}

-(NSMutableArray*)getData{
    return _companies;
}

-(void)deleteCompany:(Company*)comp{
    _delegate = (EMAppDelegate*)[[UIApplication sharedApplication]delegate];
    [_delegate.managedObjectContext deleteObject:comp];
    [_delegate saveContext];
}

@end