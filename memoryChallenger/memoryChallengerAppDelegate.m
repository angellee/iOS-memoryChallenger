//
//  memoryChallengerAppDelegate.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-31.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "memoryChallengerAppDelegate.h"

#import "memoryChallengerViewController.h"

@implementation memoryChallengerAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize mainArray;
@synthesize counter;
@synthesize arraySize;
@synthesize correctButton;

-(void) displayView:(int)myView{
    [viewController displayView: myView];
    
}

- (id) init;
{
    arraySize = [NSNumber numberWithInt:4];
    counter = [NSNumber numberWithInt:0];
    return [super init];
}

- (void)dealloc
{
    [mainArray release];
    [counter release];
    [arraySize release];
    [correctButton release];
    [viewController release];
    [window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[memoryChallengerViewController alloc] initWithNibName:@"memoryChallengerViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
