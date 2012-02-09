//
//  ComicUITableViewCell.m
//  iComics
//
//  Created by Lion User on 08/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicUITableViewCell.h"
#import "Comic.h"

@implementation ComicUITableViewCell

@synthesize comicName = comicName, cover = cover;

-(Comic*) comic
{
    return comic;
}
-(void) setComic:(Comic*)newComic
{
    [comic release];
    comic = [newComic retain];
    self.comicName.text = self.comic.name;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc {
    [comicName release];
    [cover release];
    [comic release];
    [super dealloc];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end