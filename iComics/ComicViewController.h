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
@property(retain) IBOutlet UIButton *backButton;
@property(retain) Comic *comic;

-(IBAction)goBack:(id)sender;
-(void)handleLeftSwipe;
-(void)handleRightSwipe;
-(void)handleTopSwipe;
-(void)handleBottomSwipe;
-(void)handleSwipe:(UISwipeGestureRecognizerDirection)direction;
-(void)setImageFromPath:(NSString *)newPath;

@end
