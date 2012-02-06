//
//  Comic.h
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include <Foundation/Foundation.h>


@interface Comic : NSObject
{
@private NSString *_name;
@private int _number;
@private int _pagesCount;
@private NSDate *_publishDate;
@private NSString *_coverName;
@private NSString *_path;
@private NSMutableArray *_pages;
@private int _currentPage;
    
}

-(Comic *) initWithName:(NSString *)name Number:(int)number PagesCount:(int)pagesCount PublishDate:(NSDate *) publishDate CoverName:(NSString *)coverName Path:(NSString *)path Pages:(NSMutableArray *)pages;

-(void) moveTileLeft;
-(void) moveTileRight;
-(void) moveTileUp;
-(void) moveTileDown;
-(NSString *) getCurrentTilePath;
	
@property(retain) NSString *name;
@property int number;
@property int pagesCount;
@property(retain) NSDate *publishDate;
@property(retain) NSString *coverName;
@property(retain) NSMutableArray *pages;
@property(retain) NSString *path;
@property(readonly) int currentPage;

@end

