//
//  Comic.m
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Comic.h"
#import "ComicPage.h"

@implementation Comic

@synthesize name = _name;
@synthesize number = _number;
@synthesize pagesCount = _pagesCount;
@synthesize publishDate = _publishDate;
@synthesize coverName = _coverName;
@synthesize pages = _pages;
@synthesize path = _path;
@synthesize currentPage = _currentPage;

-(Comic *) initWithName:(NSString *)name Number:(int)number PagesCount:(int)pagesCount PublishDate:(NSDate *) publishDate CoverName:(NSString *)coverName Path:(NSString *)path Pages:(NSMutableArray *)pages
{
    self = [super init];
    
    self.name = name;
    self.number = number;
    self.pagesCount = pagesCount;
    self.publishDate = publishDate;
    self.coverName = coverName;
    self.path = path;
    self.pages = pages;
    _currentPage = -1;
    
    return self;
}

- (void)dealloc 
{
    [_name release];
    [_publishDate release];
    [_coverName release];
    [_path release];
    [_pages release];
    
    [super dealloc];
}

-(NSString *) getCoverFullPath
{
    return [_path stringByAppendingString:_coverName]; 
}

-(NSString *) getCurrentTilePath
{
    if(_currentPage == -1)
    {
        return [self getCoverFullPath];
    }
    if(_currentPage == [_pages count])
    {
        return nil;
    }
    ComicPage *page = [_pages objectAtIndex:_currentPage];
    return [_path stringByAppendingString:[page currentTile]]; 
}


-(void) moveTileLeft
{
    bool endReached = _currentPage == [_pages count];
    if(endReached)
    {
        _currentPage--;
    }
    if(_currentPage == -1)
    {
        return;
    }
    
    ComicPage *page = [_pages objectAtIndex:_currentPage];
    if(!endReached)
    {
        [page moveLeft];
    }
    if ([page proceedToPreviousPage]) 
    {
        _currentPage--;
        [page close];
    }
    
}

-(void) moveTileRight
{
    bool isCoverSelected = _currentPage == -1;
    if(isCoverSelected)
    {
        _currentPage++;
    }
    if(_currentPage == [_pages count])
    {
        return;
    }
    
    ComicPage *page = [_pages objectAtIndex:_currentPage];
    if(!isCoverSelected)
    {
        [page moveRight];
    }
    if ([page proceedToNextPage]) 
    {
        _currentPage++;
        [page close];
    }
    
}

-(void) moveTileUp
{
    if(_currentPage == -1 || _currentPage == [_pages count])
    {
        return;
    }
    ComicPage *page = [_pages objectAtIndex:_currentPage];
    [page moveUp];
}

-(void) moveTileDown
{
    if(_currentPage == -1 || _currentPage == [_pages count])
    {
        return;
    }
    ComicPage *page = [_pages objectAtIndex:_currentPage];
    [page moveDown];
}



@end
