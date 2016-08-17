//
//  ParseProxy.h
//  Quick Order
//
//  Created by rckrbn on 8/08/13.
//  Copyright (c) 2013 com.rockerben. All rights reserved.
//

#import <Parse/Parse.h>

@interface ParseProxy : NSObject
+ (void)findAllObjectsWithQuery:(PFQuery *)query withBlock:(void (^)(NSArray *objects, NSError *error))block;
@end
