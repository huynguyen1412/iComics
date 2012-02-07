//
//  ComicsListController.h
//  iComics
//
//  Created by Lion User on 07/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComicsListController : UITableViewController
{
    NSMutableArray *_comics;
}

@property(retain) NSMutableArray *comics;

@end
