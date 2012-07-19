//
//  playerView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-02.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "playerView.h"
#import "memoryChallengerAppDelegate.h"

@implementation playerView

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

- (void)goToButtonView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:3];
}
- (void)goToNiceView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:6];
}

- (void)goToOopsView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [appDelegate displayView:7];
}


#pragma mark - View lifecycle

-(void) initPlayerView{
    
    // add buttons to view
    UIImageView *playerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 323)];
    playerView.userInteractionEnabled = YES;
    [playerView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];
    
    // create red button
    UIImage *red = [UIImage imageNamed:@"redButton.png"];
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    redButton.frame = CGRectMake(0, 0, red.size.width, red.size.height);
    [redButton setTag:1];
    
    // set image for red button
    [redButton setImage:red forState:UIControlStateNormal];    
    [redButton setCenter:CGPointMake(CGRectGetMidX([playerView bounds]), redButton.frame.size.height/2)];
    // attach an event for red button
    [redButton addTarget:self action:@selector(buttonClicked:)
        forControlEvents:UIControlEventTouchUpInside];   
    
    // create yellow button
    UIImage *yellow = [UIImage imageNamed:@"yellowButton.png"];
    UIButton *yellowButton = [UIButton buttonWithType:UIButtonTypeCustom];
    yellowButton.frame = CGRectMake(0, 0, yellow.size.width, yellow.size.height);
    [yellowButton setTag:2];
    
    // set image for yellow button
    [yellowButton setImage:yellow forState:UIControlStateNormal];
    [yellowButton setCenter:CGPointMake(CGRectGetMaxX([playerView bounds])- yellowButton.frame.size.width/2, CGRectGetMidY([playerView bounds]))];
   
    // attach an event for yellow button
    [yellowButton addTarget:self action:@selector(buttonClicked:)
           forControlEvents:UIControlEventTouchUpInside]; 
    
    // create green button
    UIImage *green = [UIImage imageNamed:@"greenButton.png"];
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    greenButton.frame = CGRectMake(0, 0, green.size.width, green.size.height);
    [greenButton setTag:3];
    
    // set image for green button
    [greenButton setImage:green forState:UIControlStateNormal];
    [greenButton setCenter:CGPointMake(CGRectGetMidX([playerView bounds]), CGRectGetMaxY([playerView bounds]) - greenButton.frame.size.height/2)];
    // attach an event
    [greenButton addTarget:self action:@selector(buttonClicked:)
          forControlEvents:UIControlEventTouchUpInside]; 
    
    // create blue button
    UIImage *blue = [UIImage imageNamed:@"blueButton.png"];
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    blueButton.frame = CGRectMake(0, 0,blue.size.width, blue.size.height);
    [blueButton setTag:4];
    
    // set image for blue button
    [blueButton setImage:blue forState:UIControlStateNormal];
    [blueButton setCenter:CGPointMake(blueButton.frame.size.width/2, CGRectGetMidY([playerView bounds]))]; 
    // attach an event for blue button
    [blueButton addTarget:self action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside]; 
    
    // create restart button
    UIImage *start = [UIImage imageNamed:@"startButton.png"];
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeCustom];
    startButton.frame = CGRectMake(0, 0,start.size.width, start.size.height);
    [startButton setTag:0];
    
    // set image for restart button
    [startButton setImage:start forState:UIControlStateNormal];
    [startButton setCenter:CGPointMake(CGRectGetMidX([playerView bounds]), CGRectGetMidY([playerView bounds]))];
    
    // attach an event for restart button
    [startButton addTarget:self action:@selector(buttonClicked:)
          forControlEvents:UIControlEventTouchUpInside];  
    
    // add subviews to playerView
    [playerView addSubview:startButton];
    [playerView addSubview:redButton];
    [playerView addSubview:yellowButton];
    [playerView addSubview:greenButton];
    [playerView addSubview:blueButton];
    [self.view addSubview:playerView];
    [playerView release];
 
}


// method to capture what player has pressed
-(void) buttonClicked:(id) sender{
    const int tag = [sender tag];
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSNumber *temp = [appDelegate.mainArray objectAtIndex: [appDelegate.counter intValue]];

    // if player want to restart
    if(tag == 0){
            // reset counter to point to the first element of the array
            appDelegate.counter = [NSNumber numberWithInt:0];
            // reset array size to be default == 4
            appDelegate.arraySize = [NSNumber numberWithInt:4];
            // go to mainView        
            [self goToMainView];
    }
        
    // if player select a incorrect button
    else if([temp intValue]!=tag){

        // reset counter to point to the first element of the array
        appDelegate.counter = [NSNumber numberWithInt:0];
        // reset array size to be default == 4
        appDelegate.arraySize = [NSNumber numberWithInt:4];
        appDelegate.correctButton = temp;
            
        [self goToOopsView];

    }       
    // if it reaches end of array
    else if([appDelegate.counter intValue]+1 == [appDelegate.arraySize intValue]){
      
        // increment array size by one
        int value = [appDelegate.arraySize intValue]; 
        appDelegate.arraySize = [NSNumber numberWithInt: value + 1];
        // reset counter to point to the first element of the array
        appDelegate.counter = [NSNumber numberWithInt:0];
   
        [self goToNiceView];
    }  
        
    // increment counter iterator to the next item
    else{
        int value2 = [appDelegate.counter intValue];
        appDelegate.counter = [NSNumber numberWithInt:value2 + 1];
    }
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self initPlayerView];
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
