//
//  AppDelegate.m
//
//  Created by Andrew Carter on 1/31/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import "AppDelegate.h"

#import "MTStackViewController.h"
#import "MTMenuViewController.h"
#import <Parse/Parse.h>

//#import "MTStackDefaultContainerView.h"
//#import "MTStackFoldView.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"aYpmsrVBdYTHjZWyu4YTxyKRFB0eHT75AzA5eZoU"
                  clientKey:@"jyYixoUyJYWJjHC2l8bAPSACZjA3BSY1uaYKclGE"];
    
    
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[self window] setBackgroundColor:[UIColor whiteColor]];

    MTStackViewController *stackViewController = [[MTStackViewController alloc] initWithNibName:nil bundle:nil];
    [stackViewController setAnimationDurationProportionalToPosition:YES];
    
    MTMenuViewController *menuViewController = [[MTMenuViewController alloc] initWithNibName:nil bundle:nil];
    [stackViewController setLeftViewController:menuViewController];

    
    //UITableViewController* tableViewController = [[UITableViewController alloc] initWithNibName:nil bundle:nil];
     UITableViewController *viewController = [[UIStoryboard storyboardWithName:@"StoryboardPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"OrderScreen"];
    
    [stackViewController setRightViewController:viewController];
    stackViewController.rightViewControllerEnabled = YES;
    
    UINavigationController *contentNavigationController = [UINavigationController new];
    [stackViewController setContentViewController:contentNavigationController];
    
    [[self window] setRootViewController:stackViewController];
    [[self window] makeKeyAndVisible];
    
    return YES;
}


@end
