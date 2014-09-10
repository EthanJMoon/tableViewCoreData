//
//  EMCoreDataManager.h
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EMAppDelegate.h"
#import "Product.h"
#import "Company.h"


@interface EMCoreDataManager : NSObject

+(EMCoreDataManager*)coreDataManager;
-(id)init;
-(NSMutableArray*)getData;
-(void)deleteCompany:(Company*)comp;

@end
