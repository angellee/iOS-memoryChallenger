//
//  newGameView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-26.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "newGameView.h"
#import "memoryChallengerAppDelegate.h"


@implementation newGameView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)goToMainView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:1];
}


-(void) initGameView
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    UIImageView *gameView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 87)];
    gameView.userInteractionEnabled = YES;
    [gameView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    
    // create game start button
    UIImage *game = [UIImage imageNamed:@"gameScreen.png"];
    UIButton *gameButton = [UIButton buttonWithType:UIButtonTypeCustom];
    gameButton.frame = CGRectMake(0, 0, game.size.width, game.size.height);
    [gameButton setTag: 1];
    
    // set image for game start buton
    [gameButton setImage:game forState:UIControlStateNormal];    
    [gameButton setCenter:CGPointMake(CGRectGetMidX([gameView bounds]), gameButton.frame.size.height/2)];
    // attach an event 
    [gameButton addTarget:self action:@selector(buttonClicked)
        forControlEvents:UIControlEventTouchUpInside];   

    [gameView addSubview:gameButton];
    [self.view addSubview:gameView];
    [gameView release];
}


-(void) buttonClicked{
         [self goToMainView];
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
    [self initGameView];
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
