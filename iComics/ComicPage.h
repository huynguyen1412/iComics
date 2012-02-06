//
//  ComicPage.h
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface ComicPage : 	NSObject
{
@private NSMutableArray *_lines;
@private int _currentRow;
@private int _currentColumn;
@private BOOL _proceedToNextPage;
@private BOOL _proceedToPreviousPage;
@private NSString *_currentTile;
}

-(ComicPage *) initWithLines:(NSMutableArray *)pageLines;

-(void) moveLeft;
-(void) moveRight;
-(void) moveUp;
-(void) moveDown;
-(void) close;

@property(retain) NSMutableArray *lines;
@property(readonly) int currentRow;
@property(readonly) int currentColumn;
@property(readonly) BOOL proceedToNextPage;
@property(readonly) BOOL proceedToPreviousPage;
@property(retain) NSString *currentTile;

@end
