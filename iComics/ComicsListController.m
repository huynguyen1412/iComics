//
//  ComicsListController.m
//  iComics
//
//  Created by Lion User on 07/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ComicsListController.h"
#import "Comic.h"
#import "ComicPage.h"
#import "ComicUITableViewCell.h"
#import "ComicDetailsViewController.h"

@implementation ComicsListController

@synthesize comics = _comics, search, comicsTable;
@dynamic view;

#warning get comic data loading it from library
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        NSMutableArray *comic1_page1_line1 = [NSMutableArray arrayWithObjects:@"line1_tile1", @"line1_tile2", @"line1_tile3", nil];
        NSMutableArray *comic1_page1_line2 = [NSMutableArray arrayWithObjects:@"line2_tile1", @"line2_tile2", nil];
        ComicPage *comic1page1 = [[ComicPage alloc] initWithLines:[NSMutableArray arrayWithObjects:comic1_page1_line1, comic1_page1_line2, nil]];
        Comic *comic1 = [[[Comic alloc] initWithName:@"Comic1" Number:1 PagesCount:23 PublishDate:[[[NSDate alloc] init]autorelease] CoverName:@"cover.jpg" Path:@"/comic1/" Pages:[NSMutableArray arrayWithObjects:comic1page1, nil]] autorelease];
        self.comics = [NSMutableArray arrayWithObjects: comic1, nil];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.comics count]; 
}

- (Comic *)getComicAt:(NSIndexPath *)indexPath
{
    Comic *comic = [self.comics objectAtIndex:indexPath.row];
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
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    

    ComicDetailsViewController *detailViewController = [[ComicDetailsViewController alloc] initWithNibName:@"ComicDetailsViewController" bundle:nil];
    
    detailViewController.comic = [self getComicAt:indexPath];
    
    [self presentViewController:detailViewController animated:YES completion:NULL];
    //[self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];

}

@end
