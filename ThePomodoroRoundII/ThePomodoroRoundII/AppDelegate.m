//
//  AppDelegate.m
//  ThePomodoroRoundII
//
//  Created by Ethan Hess on 5/11/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "AppDelegate.h"
#import "TimerViewController.h"
#import "RoundsViewController.h"
#import "AppearanceController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TimerViewController *timerVC = [[TimerViewController alloc] init];
    timerVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Timer" image:[UIImage imageNamed:@"timer"] tag:0];
    
    RoundsViewController *roundsVC = [[RoundsViewController alloc] init];
    UINavigationController *roundsNavVC = [[UINavigationController alloc]initWithRootViewController:roundsVC];
    roundsNavVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Rounds" image:[UIImage imageNamed:@"rounds"] tag:1];
    
    [AppearanceController setUpAppearance];
    
    //Create tab bar controller and add view controllers to it
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[timerVC, roundsNavVC];
    
    self.window.rootViewController = tabBarController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
