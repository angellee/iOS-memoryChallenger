//
//  correctButtonView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-16.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "correctButtonView.h"
#import "memoryChallengerAppDelegate.h"

@implementation correctButtonView

- (void)goToGameView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:5];
}


-(void) initButtonView{

    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    UIImage *button = [UIImage imageNamed:@"buttons.png"];
    NSMutableArray *buttonArray = [[NSMutableArray alloc] init];
    int tag = [appDelegate.correctButton intValue];
    
    // set view location
    UIImageView *buttonView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 323)];
    [buttonView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    
    if(tag == 1){
        UIImage *red =[UIImage imageNamed:@"redLight.png"];
        [buttonArray addObject: button];
        [buttonArray addObject: red];
        [buttonArray addObject: button];
        [buttonArray addObject: red];
        [buttonArray addObject: button];
        [buttonArray addObject: red];
    }
    else if(tag == 2){
        UIImage *yellow =[UIImage imageNamed:@"yellowLight.png"];
        [buttonArray addObject: button];
        [buttonArray addObject: yellow];
        [buttonArray addObject: button];
        [buttonArray addObject: yellow];
        [buttonArray addObject: button];
        [buttonArray addObject: yellow];
    }
    else if(tag ==3){
        UIImage *green =[UIImage imageNamed:@"greenLight.png"];
        [buttonArray addObject: button];
        [buttonArray addObject: green];
        [buttonArray addObject: button];
        [buttonArray addObject: green];
        [buttonArray addObject: button];
        [buttonArray addObject: green];
    }
    else
    {
        UIImage *blue =[UIImage imageNamed:@"blueLight.png"];
        [buttonArray addObject: button];
        [buttonArray addObject: blue];
        [buttonArray addObject: button];
        [buttonArray addObject: blue];
        [buttonArray addObject: button];
        [buttonArray addObject: blue];
        
    }
    [buttonArray addObject: button];
    buttonView.animationImages = buttonArray;
    buttonView.animationDuration = 3;
    buttonView.animationRepeatCount = 1;
    [buttonView startAnimating];
    [self.view addSubview:buttonView];
    [buttonArray release];
    [buttonView release];
    
        
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
    [self initButtonView];
    [NSTimer scheduledTimerWithTimeInterval:3.00 target:self selector:@selector(goToGameView) userInfo:nil repeats:NO];
  

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
