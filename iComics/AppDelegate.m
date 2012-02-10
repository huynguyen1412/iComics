//
//  AppDelegate.m
//  iComics
//
//  Created by Lion User on 05/02/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "SecondViewController.h"

#import "ComicsListController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (void)createTestData
{
    NSString *appFolderPath = [[NSBundle mainBundle] resourcePath];
    NSString *comicsLibraryPath = [appFolderPath stringByAppendingString:@"/ComicsLibrary/comic1"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL libraryExists = [fileManager fileExistsAtPath:comicsLibraryPath];
    if(!libraryExists)
    {
        [fileManager createDirectoryAtPath:comicsLibraryPath withIntermediateDirectories:YES attributes:nil error:nil];
        NSArray *comicFiles = [NSArray arrayWithObjects: 
                               @"contents.xml",
                               @"cover.jpg",
                               @"line1_tile1.jpg",
                               @"line1_tile2.jpg",
                               @"line1_tile3.jpg",
                               @"line2_tile1.jpg",
                               @"line2_tile2.jpg", nil];
        for(NSString *comicFile in comicFiles)
        {
            [fileManager copyItemAtPath:
             [[appFolderPath stringByAppendingString: @"/"] stringByAppendingString:comicFile] toPath:
             [[comicsLibraryPath stringByAppendingString: @"/"] stringByAppendingString:comicFile] error:nil];
        }
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self createTestData];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *viewController1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewController1 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController_iPhone" bundle:nil] autorelease];
    } else {
        viewController1 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController_iPad" bundle:nil] autorelease];
    }
    
    ComicsListController *rootViewController = [[[ComicsListController alloc] initWithNibName:@"ComicsListController" bundle:nil] autorelease];	
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, rootViewController, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
