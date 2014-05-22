//
//  AppDelegate.m
//  SampleApp
//
//  Created by Admin on 5/15/14.
//  Copyright (c) 2014 ls. All rights reserved.
//

#import "AppDelegate.h"
#import <DrupalLib/DrupalSDK.h>
#import <DrupalLib/DrupalEntitySerializer.h>
#import <DrupalLib/DrupalEntityDeserializer.h>
#import <DrupalLib/DrupalEntity.h>
#import <DrupalLib/DrupalAPIManager.h>

#import <objc/runtime.h>

#import "BlogPost.h"
#import "BlogPage.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [DrupalAPIManager sharedDrupalAPIManager].baseURL = [NSURL URLWithString:@"http://vh015.uk.dev-ls.co.uk"];
    
    BlogPage *page = [BlogPage new];
    page.page = @(1);
    [page pullFromServerWithDelegate:nil];
    
    BlogPost *post = [BlogPost new];
    post.nid = @"3";
    [post pullFromServerWithDelegate:nil];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
