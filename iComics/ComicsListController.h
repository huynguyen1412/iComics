//
//  ComicsListController.h
//  iComics
//
//  Created by Lion User on 07/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ComicsListController : UIViewController <UITableViewDelegate, UITableViewDataSource>  
{
    NSMutableArray *_comics;
}

@property (nonatomic, retain) IBOutlet UISearchBar* search;
@property (nonatomic, retain) IBOutlet UITableView* comicsTable;
@property(nonatomic, retain) IBOutlet UIView* view;
@property(nonatomic, retain) NSMutableArray *comics;


@end
