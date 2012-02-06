//
//  ComicPage.m
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicPage.h"

@implementation ComicPage

@synthesize lines;
@synthesize currentRow;
@synthesize currentColumn;
@synthesize proceedToNextPage;
@synthesize proceedToPreviousPage;
@synthesize currentTile;

-(ComicPage *) initWithLines:(NSMutableArray*)pageLines
{
    self = [super init];
    self.lines = pageLines;
    currentRow = 0;
    currentColumn = 0;
    proceedToNextPage = false;
    proceedToNextPage = false;
    
    return self;
}

-(void) moveLeft;
{
    int newCurrentRow = self.currentRow;
    int newCurrentColumn = self.currentColumn;
    newCurrentColumn--;
    
    if(currentRow >= [self.lines count])
    {
        return;
    }
    
    if(newCurrentColumn < 0)
    {
        newCurrentRow --;
        if(newCurrentRow < 0)
        {
            proceedToPreviousPage = true;
            self.currentTile = nil;
            return;
        }
        else
        {
            newCurrentColumn = [(NSMutableArray*)[self.lines objectAtIndex:currentRow] count] - 1;
        }
    }
    
    if(newCurrentColumn < 0)
    {
        newCurrentColumn = 0;
    }
    
    currentRow = newCurrentRow;
    currentColumn = newCurrentColumn;
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:currentRow] objectAtIndex:currentColumn];

}

-(void) moveRight
{
    int newCurrentRow = self.currentRow;
    int newCurrentColumn = self.currentColumn;
    newCurrentColumn++;
    
    if(currentRow >= [self.lines count])
    {
        return;
    }
    NSMutableArray *currentLineTiles = [self.lines objectAtIndex:newCurrentRow];
    
    if(newCurrentColumn >= [currentLineTiles count])
    {
        newCurrentColumn = 0;
        newCurrentRow ++;
    }
    
    if(newCurrentRow >= [self.lines count])
    {
        proceedToNextPage = true;
        self.currentTile = nil;
        return;
    }
    
    currentRow = newCurrentRow;
    currentColumn = newCurrentColumn;
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:currentRow] objectAtIndex:currentColumn];
    
}

-(void) moveUp
{
    int newCurrentRow = self.currentRow;
    newCurrentRow--;
    if(newCurrentRow < 0)
    {
        return;
    }
    currentRow = newCurrentRow;
    int currentRowMaxIndex = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] count] - 1;
    int colIndex = currentColumn > currentRowMaxIndex ? currentRowMaxIndex : currentColumn;
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] objectAtIndex:colIndex];
    
}

-(void) moveDown
{
    int newCurrentRow = self.currentRow;
    newCurrentRow++;
    if(newCurrentRow >= [self.lines count])
    {
        return;
    }
    currentRow = newCurrentRow;
    int currentRowMaxIndex = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] count] - 1;
    int colIndex = currentColumn > currentRowMaxIndex ? currentRowMaxIndex : currentColumn;
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] objectAtIndex:colIndex];
}

-(void)dealloc
{
    [lines release];
    [currentTile release];
}


@end
