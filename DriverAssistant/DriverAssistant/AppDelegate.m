//
//  AppDelegate.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/28.
//  Copyright © 2016年 my. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIViewController *rootView = [[UIViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //rootView.view.backgroundColor = [UIColor blueColor];
    self.window.rootViewController = rootView;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
