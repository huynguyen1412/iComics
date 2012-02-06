//
//  ComicPage.m
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicPage.h"

@implementation ComicPage

@synthesize lines = _lines;
@synthesize currentRow = _currentRow;
@synthesize currentColumn = _currentColumn;
@synthesize proceedToNextPage = _proceedToNextPage;
@synthesize proceedToPreviousPage = _proceedToPreviousPage;
@synthesize currentTile = _currentTile;

-(ComicPage *) initWithLines:(NSMutableArray*)pageLines
{
    self = [super init];
    self.lines = pageLines;
    _currentRow = 0;
    _currentColumn = 0;
    _proceedToPreviousPage = NO;
    _proceedToNextPage = NO;
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:_currentRow] objectAtIndex:_currentColumn];
    
    return self;
}

-(void)dealloc
{
    [_lines release];
    [_currentTile release];
    [super dealloc];
}

- (void)setCurrentTilePathAtColumnIndex:(int)colIndex andRowIndex:(int)rowIndex
{
    self.currentTile = [(NSMutableArray *)[self.lines objectAtIndex:rowIndex] objectAtIndex:colIndex];
}

-(void) moveLeft;
{
    int newCurrentRow = self.currentRow;
    int newCurrentColumn = self.currentColumn;
    newCurrentColumn--;
    
    if(_currentRow >= [self.lines count])
    {
        return;
    }
    
    if(newCurrentColumn < 0)
    {
        newCurrentRow --;
        if(newCurrentRow < 0)
        {
            _proceedToPreviousPage = YES;
            return;
        }
        else
        {
            newCurrentColumn = [(NSMutableArray*)[self.lines objectAtIndex:_currentRow] count] - 1;
        }
    }
    
    if(newCurrentColumn < 0)
    {
        newCurrentColumn = 0;
    }
    
    _currentRow = newCurrentRow;
    _currentColumn = newCurrentColumn;
    [self setCurrentTilePathAtColumnIndex:_currentColumn andRowIndex:_currentRow];

}

-(void) moveRight
{
    int newCurrentRow = self.currentRow;
    int newCurrentColumn = self.currentColumn;
    newCurrentColumn++;
    
    if(_currentRow >= [self.lines count])
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
        _proceedToNextPage = YES;
        return;
    }
    
    _currentRow = newCurrentRow;
    _currentColumn = newCurrentColumn;
    [self setCurrentTilePathAtColumnIndex:_currentColumn andRowIndex:_currentRow];
    
}

-(void) moveUp
{
    int newCurrentRow = self.currentRow;
    newCurrentRow--;
    if(newCurrentRow < 0)
    {
        return;
    }
    _currentRow = newCurrentRow;
    int currentRowMaxIndex = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] count] - 1;
    int colIndex = _currentColumn > currentRowMaxIndex ? currentRowMaxIndex : _currentColumn;
    [self setCurrentTilePathAtColumnIndex:colIndex andRowIndex:newCurrentRow];
    
}

-(void) moveDown
{
    int newCurrentRow = self.currentRow;
    newCurrentRow++;
    if(newCurrentRow >= [self.lines count])
    {
        return;
    }
    _currentRow = newCurrentRow;
    int currentRowMaxIndex = [(NSMutableArray *)[self.lines objectAtIndex:newCurrentRow] count] - 1;
    int colIndex = _currentColumn > currentRowMaxIndex ? currentRowMaxIndex : _currentColumn;
    [self setCurrentTilePathAtColumnIndex:colIndex andRowIndex:newCurrentRow];
}

-(void) close
{
    _proceedToPreviousPage = NO;
    _proceedToNextPage = NO;
}


@end
