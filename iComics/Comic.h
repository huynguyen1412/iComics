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
@private NSString *name;
    
@private int number;
    	
@private int pagesCount;
    
@private NSDate *publishDate;
    
@private NSString *coverPath;
    
@private NSMutableArray *pages;
    
}

@property(retain) NSString *name;
@property int number;
@property int pagesCount;
@property(retain) NSDate *publishDate;
@property(retain) NSString *coverPath;
@property(retain) NSMutableArray *pages;


@end

