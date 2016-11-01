//
//  AppDelegate.m
//  DriverAssistant
//
//  Created by 梅毅 on 16/10/28.
//  Copyright © 2016年 my. All rights reserved.
//

#import "AppDelegate.h"
#import "WMBaiBaoXiangViewController.h"
#import "WMBaoMingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    WMBaoMingViewController *rootView = [[WMBaoMingViewController alloc] init];
    //rootView.view.backgroundColor = [UIColor blueColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootView];
    self.window.rootViewController = nav;
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
