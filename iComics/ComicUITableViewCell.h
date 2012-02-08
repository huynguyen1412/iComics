//
//  ComicUITableViewCell.h
//  iComics
//
//  Created by Lion User on 08/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicUITableViewCell : UITableViewCell
{
    IBOutlet UILabel *comicName;
    IBOutlet UIImageView *cover;

}

@property(retain) IBOutlet UILabel *comicName;
@property(retain) IBOutlet UIImageView *cover;

@end