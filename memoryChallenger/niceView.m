//
//  niceView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "niceView.h"
#import "memoryChallengerAppDelegate.h"

@implementation niceView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goToMainView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:1];
}

-(void) initNiceView{
    
    UIImage *nice = [UIImage imageNamed:@"niceT.png"];
    
    // set location of niceView
    UIImageView *niceView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 109)];
    [niceView setImage: nice];
    [niceView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    [self.view addSubview:niceView];
    [niceView release];
    
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
 
 
 // initialize niceView
 [self initNiceView];
 [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(goToMainView) userInfo:nil repeats:NO];
 
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
