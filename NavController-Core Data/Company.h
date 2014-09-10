//
//  Company.h
//  NavController-Core Data
//
//  Created by Ethan on 4/16/14.
//  Copyright (c) 2014 Ethan Moon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Company : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * stockSymbol;
@property (nonatomic, retain) NSSet *newRelationship;
@end

@interface Company (CoreDataGeneratedAccessors)

- (void)addNewRelationshipObject:(NSManagedObject *)value;
- (void)removeNewRelationshipObject:(NSManagedObject *)value;
- (void)addNewRelationship:(NSSet *)values;
- (void)removeNewRelationship:(NSSet *)values;

@end
