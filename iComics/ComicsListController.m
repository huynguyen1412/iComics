//
//  ComicsListController.m
//  iComics
//
//  Created by Lion User on 07/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicsListController.h"
#import "Comic.h"
#import "ComicUITableViewCell.h"
#import "ComicViewController.h"

@implementation ComicsListController

@synthesize comics = _comics, search, comicsTable;
@dynamic view;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {

    }
    return self;
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.comics count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSMutableArray *)[self.comics objectAtIndex:section] count];
}

- (Comic *)getComicAt:(NSIndexPath *)indexPath
{
    Comic *comic = [(NSMutableArray *)[self.comics objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return comic;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ComicUITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        
        NSArray* views = [[NSBundle mainBundle] loadNibNamed:@"ComicUITableViewCell" owner:nil options:nil];
        
        for (UIView *cellView in views)
        {
            if([cellView isKindOfClass:[ComicUITableViewCell class]])
            {
                cell = (ComicUITableViewCell*)cellView;
            }
        }
    }
    Comic *comic;
    comic = [self getComicAt:indexPath];
    cell.comic = comic;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 222;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Comic *comic = [(NSMutableArray *)[self.comics objectAtIndex:section] objectAtIndex:0];
    return comic.name;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ComicViewController *detailViewController = [[ComicViewController alloc] initWithNibName:@"ComicViewController" bundle:nil];
    
    detailViewController.comic = [self getComicAt:indexPath];
    
    [self presentViewController:detailViewController animated:YES completion:NULL];
    [detailViewController release];

}

@end
