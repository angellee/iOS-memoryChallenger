//
//  memoryChallengerAppDelegate.h
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-31.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "mainView.h"
#import "playerView.h"

@class memoryChallengerViewController;

@interface memoryChallengerAppDelegate : NSObject <UIApplicationDelegate>{
    UIWindow *window;
    memoryChallengerViewController *viewController;
    NSMutableArray* mainArray;
    NSNumber *counter, *arraySize, *correctButton;
    
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet memoryChallengerViewController *viewController;

@property (nonatomic, retain)  NSMutableArray* mainArray;
@property (nonatomic, retain)  NSNumber *counter;
@property (nonatomic, retain)  NSNumber *arraySize;
@property (nonatomic, retain)  NSNumber *correctButton;


-(void) displayView: (int) myView;


@end


