//
//  ComicDetailsViewController.m
//  iComics
//
//  Created by Lion User on 08/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicViewController.h"
#import "Comic.h"
#import <QuartzCore/QuartzCore.h>

@implementation ComicViewController

@synthesize cover = cover;

@dynamic comic;
-(Comic*) comic
{
    return comic;
}
-(void) setComic:(Comic*)newComic
{
    [comic release];
    comic = [newComic retain];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)handleLeftSwipe
{
    [self handleSwipe:UISwipeGestureRecognizerDirectionLeft];
}

-(void)handleRightSwipe
{
    [self handleSwipe:UISwipeGestureRecognizerDirectionRight];
}

-(void)handleTopSwipe
{
    [self handleSwipe:UISwipeGestureRecognizerDirectionUp];
}

-(void)handleBottomSwipe
{
    [self handleSwipe:UISwipeGestureRecognizerDirectionDown];
}

-(void) handleSwipe:(UISwipeGestureRecognizerDirection)direction
{
    NSString *imagePath = [self.comic getCurrentTilePath];
    NSString *animationSubType = nil;
    switch (direction)
    {
        case UISwipeGestureRecognizerDirectionLeft:
            [self.comic moveTileRight];
            NSLog(@"moved to tile right");
            animationSubType = kCATransitionFromRight;
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self.comic moveTileLeft];
            NSLog(@"moved to tile left");
            animationSubType = kCATransitionFromLeft;
            break;
        case UISwipeGestureRecognizerDirectionUp:
            [self.comic moveTileDown];
            NSLog(@"moved to tile down");
            animationSubType = kCATransitionFromTop;
            break;
        case UISwipeGestureRecognizerDirectionDown:
            [self.comic moveTileUp];
            NSLog(@"moved to tile up");
            animationSubType = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    NSString *newPath = [self.comic getCurrentTilePath];
    
    if(imagePath == nil)
    {
        imagePath = @"first.png";
    }
    if(newPath == nil)
    {
        newPath = @"first.png";;
    }
    
    NSLog(@"Previous path: %@", imagePath);
    NSLog(@"New path: %@", newPath);
    
    if(![imagePath isEqualToString: newPath])
    {
        [self setImageFromPath:newPath];
        
        CATransition *transition = [CATransition animation];
        transition.duration = 0.7f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionPush;
        transition.subtype = animationSubType;
        
        [self.cover.layer addAnimation:transition forKey:nil];
    }
}

- (void)setImageFromPath:(NSString *)newPath
{
    self.cover.image = [UIImage imageNamed:newPath];
    self.cover.contentMode = UIViewContentModeScaleAspectFit;
    self.cover.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setImageFromPath:[self.comic getCurrentTilePath]];
    
    UISwipeGestureRecognizer *leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(handleLeftSwipe)];
    leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    leftSwipeRecognizer.numberOfTouchesRequired = 1;
    [self.cover addGestureRecognizer:leftSwipeRecognizer];
    [leftSwipeRecognizer release];
    
    UISwipeGestureRecognizer *rightSwipeRecognizer = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(handleRightSwipe)];
    rightSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    rightSwipeRecognizer.numberOfTouchesRequired = 1;
    [self.cover addGestureRecognizer:rightSwipeRecognizer];
    [rightSwipeRecognizer release];
    
    UISwipeGestureRecognizer *topSwipeRecognizer = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(handleTopSwipe)];
    topSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    topSwipeRecognizer.numberOfTouchesRequired = 1;
    [self.cover addGestureRecognizer:topSwipeRecognizer];
    [topSwipeRecognizer release];
    
    UISwipeGestureRecognizer *bottomSwipeRecognizer = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(handleBottomSwipe)];
    bottomSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    bottomSwipeRecognizer.numberOfTouchesRequired = 1;
    [self.cover addGestureRecognizer:bottomSwipeRecognizer];
    [bottomSwipeRecognizer release];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}



@end
