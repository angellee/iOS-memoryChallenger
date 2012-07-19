//
//  memoryChallengerViewController.m
//  memoryChallenger
//
//  Created by Angel Lee on 11-12-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "memoryChallengerViewController.h"
#import "mainView.h"
#import "playerView.h"
#import "correctButtonView.h"
#import "goView.h"
#import "newGameView.h"
#import "niceView.h"
#import "oopsView.h"

@implementation memoryChallengerViewController

UIViewController *currentView;

-(void) displayView:(int)myView{
    [currentView.view removeFromSuperview];
    [currentView release];
    
    switch(myView){
        case 1:
            currentView = [[mainView alloc]init];
            break;
        case 2:
            currentView = [[playerView alloc]init];
            break;
        case 3:
            currentView = [[correctButtonView alloc]init];
            break;
        case 4:
            currentView = [[goView alloc]init];
            break;
            
        case 5:
            currentView = [[newGameView alloc]init];
            break;
        case 6:
            currentView = [[niceView alloc]init];
            break;
        case 7:
            currentView = [[oopsView alloc]init];
            break;
    }
    [self.view addSubview:currentView.view];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{      
    currentView = [[newGameView alloc]init];
    [self.view addSubview:currentView.view];
    
    [super viewDidLoad];    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void) dealloc{
    [currentView release];
    [super dealloc];
}

@end
