//
//  Product.h
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) Company *newRelationship;

@end
