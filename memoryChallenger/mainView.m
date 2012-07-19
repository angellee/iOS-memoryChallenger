//
//  mainView.m
//  memoryChallenger
//
//  Created by Angel Lee on 12-01-02.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "mainView.h"
#import "memoryChallengerAppDelegate.h"

@implementation mainView


#pragma mark - View lifecycle

- (void)goToGoView {
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    [appDelegate displayView:4];

}

-(void) initMainView: (int) num{
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSMutableArray *myString = [[NSMutableArray alloc] init];
    appDelegate.mainArray = [[NSMutableArray alloc]init];

    // create images for mainView
    UIImage *button = [UIImage imageNamed:@"buttons.png"];
    UIImage *red =[UIImage imageNamed:@"redLight.png"];
    UIImage *yellow = [UIImage imageNamed:@"yellowLight.png"];
    UIImage *green = [UIImage imageNamed:@"greenLight.png"];
    UIImage *blue = [UIImage imageNamed:@"blueLight.png"];    
    
    // set location of mainView
    UIImageView *mainView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 323)];
    [mainView setCenter:CGPointMake(CGRectGetMidX([self.view bounds]), CGRectGetMidY([self.view bounds]))];

    for(int i=0; i<num; i++){
        
        // generate a random number to insert in to the array
        int value = (arc4random() % 4) + 1;
        [appDelegate.mainArray addObject:[NSNumber numberWithInt:value]];
        
        //NSLog(@"%i ", value);
        
        // add images that's relative to the generated value
           switch(value){

            case 1: // red
                [myString addObject: button];
                [myString addObject: red];
                break;
                
            case 2: // yellow
                [myString addObject: button];
                [myString addObject: yellow];
                break;
                
            case 3: //green
                [myString addObject: button];
                [myString addObject: green];
                break;
                
            case 4: // blue
                [myString addObject: button];
                [myString addObject: blue];
                break;
                
        }
    }
   // NSLog(@"\n");
    
    // animate the array of images
    [myString addObject: button];
    mainView.animationImages = myString;
    mainView.animationDuration = 4;
    mainView.animationRepeatCount = 1;
    [mainView startAnimating];
    [self.view addSubview:mainView];
    [myString release];
    [mainView release];
 
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{        
    [self.view setBackgroundColor:[UIColor blackColor]];
    memoryChallengerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    // initialize mainView w/ default array size
    [self initMainView:[appDelegate.arraySize intValue]];
    [NSTimer scheduledTimerWithTimeInterval:4.00 target:self selector:@selector(goToGoView) userInfo:nil repeats:NO];

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
