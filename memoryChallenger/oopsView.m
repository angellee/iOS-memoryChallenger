//
//  oopsView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "oopsView.h"
#import "memoryChallengerAppDelegate.h"

@implementation oopsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)goToCorrectButtonView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:3];
}

-(void) initOopsView{
    
    UIImage *oops = [UIImage imageNamed:@"oopsT.png"];
    
    // set location of oopsView
    UIImageView *oopsView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 78)];
    [oopsView setImage: oops];
    [oopsView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    [self.view addSubview:oopsView];
    [oopsView release];
    
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
 
 
 // initialize oopsView
 [self initOopsView];
 [NSTimer scheduledTimerWithTimeInterval:1.00 target:self selector:@selector(goToCorrectButtonView) userInfo:nil repeats:NO];
 
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
