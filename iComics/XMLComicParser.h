//
//  XMLComicParser.h
//  iComics
//
//  Created by Lion User on 09/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Comic.h"

@interface XMLComicParser : NSObject <NSXMLParserDelegate>
{
    @private NSString *name;
    @private int number;
    @private int pagesCount;
    @private NSDate *publishDate;
    @private NSString *cover;
    @private NSMutableArray *pages;
    @private NSMutableArray *currentPageLines;
    @private NSMutableArray *currentLineTiles;
    @private NSString *currentElement;
    @private NSDateFormatter *dateFormater;
    @private NSString *directoryPath;
    @private Comic *comic;
}

@property(retain) NSString *name;
@property int number;
@property int pagesCount;
@property(retain) NSDate *publishDate;
@property(retain) NSString *cover;
@property(retain) NSMutableArray *pages;
@property(retain) NSMutableArray *currentPageLines;
@property(retain) NSMutableArray *currentLineTiles;
@property(retain) NSString *currentElement;
@property(retain) NSDateFormatter *dateFormater;
@property(retain) NSString *directoryPath;
@property(retain) Comic *comic;

-(XMLComicParser *)initWithPath:(NSString *) path;
-(void) parseComicXML:(BOOL)addPages;

@end

/*
 
 <?xml version="1.0"?>
 <comic>
 <title>XML Developer's Guide</title>
 <publish_date>2000-10-01</publish_date>
 <number>3</number>
 <pages_count>30</pages_count>
 <cover>ComicCover.jpg</cover>
 <pages>
 <page>
 <line> 
 <tile>01-01-01.jpg</tile>
 <tile>01-01-02.jpg</tile>
 <tile>01-01-03.jpg</tile>
 <tile>01-01-04.jpg</tile>
 </line>
 <line> 
 <tile>01-02-01.jpg</tile>
 <tile>01-02-02.jpg</tile>
 </line>
 <line> 
 <tile>01-03-01.jpg</tile>
 </line>
 </page>
 <page>
 <line> 
 <tile>02-01-01.jpg</tile>
 <tile>02-01-02.jpg</tile>
 </line>
 <line> 
 <tile>02-02-01.jpg</tile>
 <tile>02-02-02.jpg</tile>
 <tile>02-02-03.jpg</tile>
 <tile>02-02-04.jpg</tile>
 <tile>02-02-05.jpg</tile>
 </line>
 <line> 
 <tile>02-03-01.jpg</tile>
 <tile>02-03-02.jpg</tile>
 <tile>02-03-03.jpg</tile>
 </line>
 </page>
 </pages>
 </comic>
 */
