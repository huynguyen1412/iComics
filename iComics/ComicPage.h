//
//  ComicPage.h
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface ComicPage : NSObject
{
@private NSMutableArray *lines;
@private int currentRow;
@private int currentColumn;
}

-(void) moveLeft;
-(void) moveRight;
-(void) moveUp;
-(void) moveDown;

@property(retain) NSMutableArray *lines;
@property int currentRow;
@property int currentColumn;

@end
