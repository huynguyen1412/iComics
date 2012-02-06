//
//  ComicPage.h
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface ComicPage : 	NSObject
{
@private NSMutableArray *lines;
@private int currentRow;
@private int currentColumn;
@private bool proceedToNextPage;
@private bool proceedToPreviousPage;
@private NSString *currentTile;
}

-(id) initWithLines:(NSMutableArray *)pageLines;

-(void) moveLeft;
-(void) moveRight;
-(void) moveUp;
-(void) moveDown;

@property(retain) NSMutableArray *lines;
@property(readonly) int currentRow;
@property(readonly) int currentColumn;
@property(readonly) bool proceedToNextPage;
@property(readonly) bool proceedToPreviousPage;
@property(retain) NSString *currentTile;

@end
