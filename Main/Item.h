//
//  Item.h
//  Phoenix
//
//  Created by rckrbn on 6/09/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * itemCode;
@property (nonatomic, retain) NSString * itemDescription;

@end
