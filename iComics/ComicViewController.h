//
//  ComicDetailsViewController.h
//  iComics
//
//  Created by Lion User on 08/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comic.h"

@interface ComicViewController : UIViewController
{
    Comic *comic;
}

@property(retain) IBOutlet UIImageView *cover;
@property(retain) Comic *comic;

-(void)handleLeftSwipe;
-(void)handleRightSwipe;
-(void)handleTopSwipe;
-(void)handleBottomSwipe;
-(void) handleSwipe:(UISwipeGestureRecognizerDirection)direction;

@end
