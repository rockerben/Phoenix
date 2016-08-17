//
//  ParseProxy.m
//  Quick Order
//
//  Created by rckrbn on 8/08/13.
//  Copyright (c) 2013 com.rockerben. All rights reserved.
//

#import "ParseProxy.h"

@implementation ParseProxy

+ (void)findAllObjectsWithQuery:(PFQuery *)query withBlock:(void (^)(NSArray *objects, NSError *error))block
{
    __block NSMutableArray *allObjects = [NSMutableArray array];
    __block NSUInteger limit = 1000;
    __block NSUInteger skip = 0;
    
    typedef void  (^FetchNextPage)(void);
    FetchNextPage  __block weakPointer;
    
    FetchNextPage strongBlock = ^(void)
    {
        [query setLimit: limit];
        [query setSkip: skip];
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error)
            {
                // The find succeeded. Add the returned objects to allObjects
                [allObjects addObjectsFromArray:objects];
                
                if (objects.count == limit) {
                    // There might be more objects in the table. Update the skip value and execute the query again.
                    skip += limit;
                    [query setSkip: skip];
                    // Go get more results
                    weakPointer();
                }
                else
                {
                    // We are done so return the objects
                    block(allObjects, nil);
                }
                
            }
            else
            {
                block(nil,error);
            }
        }];
    };
    
    weakPointer = strongBlock;
    strongBlock();
    
}

@end
