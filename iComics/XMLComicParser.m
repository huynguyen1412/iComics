//
//  XMLComicParser.m
//  iComics
//
//  Created by Lion User on 09/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XMLComicParser.h"
#import "Comic.h"
#import "ComicPage.h"

@implementation XMLComicParser

@synthesize name = name, number = number, pages = pages, pagesCount = pagesCount, publishDate = publishDate, cover = cover,currentElement = currentElement, currentLineTiles = currentLineTiles, currentPageLines = currentPageLines, dateFormater = dateFormater, directoryPath = directoryPath, comic = comic;

-(XMLComicParser *)initWithPath:(NSString *) path
{
    self = [super init];
    if (self)
    {
        self.directoryPath = path;
    }
    return self;
}

-(void) parseComicXML:(BOOL)addPages
{
    self.pages = [[[NSMutableArray alloc] init] autorelease];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    self.dateFormater = dateFormat;
    [dateFormat release];
    
    NSString *absolutePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString: [@"/" stringByAppendingString: [self.directoryPath stringByAppendingString:@"contents.xml"]]];
    NSData *fileContents = [[NSData alloc] initWithContentsOfFile:absolutePath];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData: fileContents];
    [fileContents release];
    parser.delegate = self;
    [parser parse]; 
    
    Comic *parsedComic = [[Comic alloc] initWithName:self.name Number:self.number PagesCount:self.pagesCount PublishDate:self.publishDate CoverName:self.cover Path:self.directoryPath Pages:self.pages];
    self.comic = parsedComic;
    [parsedComic release];
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    self.currentElement = elementName;

    if([elementName isEqualToString:@"page"])
    {
        self.currentPageLines = [[[NSMutableArray alloc] init] autorelease];
    }
    else if([elementName isEqualToString:@"line"])
    {
        self.currentLineTiles = [[[NSMutableArray alloc] init] autorelease];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if([self.currentElement isEqualToString:@"title"])
    {
        self.name = string;
    }
    else if([self.currentElement isEqualToString:@"publish_date"])
    {
        [self.dateFormater dateFromString:string];
    }
    else if([self.currentElement isEqualToString:@"number"])
    {
        self.number = [string intValue];
    }
    else if([self.currentElement isEqualToString:@"pages_count"])
    {
         self.pagesCount = [string intValue];
    }
    else if([self.currentElement isEqualToString:@"cover"])
    {
        self.cover = string;
    }
    else if([self.currentElement isEqualToString:@"tile"])
    { 
        [currentLineTiles addObject: string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"page"])
    {
        if(self.currentPageLines != nil && [self.currentPageLines count] > 0)
        {
            ComicPage *page = [[ComicPage alloc] initWithLines: self.currentPageLines];
            [self.pages addObject: page];
            [page release];
        }
    }
    else if([elementName isEqualToString:@"line"])
    {
        if(self.currentLineTiles != nil && [self.currentLineTiles count] > 0)
        {
            [self.currentPageLines addObject:self.currentLineTiles];
        }    
    }
}

@end
