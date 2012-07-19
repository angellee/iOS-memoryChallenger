//
//  goView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-24.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "goView.h"
#import "memoryChallengerAppDelegate.h"

@implementation goView


- (void)goToPlayerView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    [appDelegate displayView:2];
    
}

-(void) initGoView{
    
 
    UIImage *go = [UIImage imageNamed:@"GO.png"];
     
    // set location of goView
    UIImageView *goView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 138)];
    [goView setImage: go];
    [goView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    [self.view addSubview:goView];
    [goView release];
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
  
    
    // initialize goView
    [self initGoView];
    [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(goToPlayerView) userInfo:nil repeats:NO];
    
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

@end
