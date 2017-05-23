//
//  AppDelegate.m
//  HotNews
//
//  Created by GaoChao on 2017/5/11.
//  Copyright © 2017年 GaoChao. All rights reserved.
//

#import "AppDelegate.h"
#import "GCHomeViewController.h"
#import "GCMainNewsViewController.h"
#import "GCLifeViewController.h"
@interface AppDelegate ()<UIScrollViewDelegate,UITabBarDelegate,UINavigationControllerDelegate,UITabBarControllerDelegate>
@property(nonatomic,strong)UITabBarController *tabBarController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[GCHomeViewController new]];
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:11];
    [homeNav.tabBarItem setImage:[UIImage imageNamed:@"home.png"]];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:[GCMainNewsViewController new]];
    mainNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"视频" image:nil tag:11];
    [mainNav.tabBarItem setImage:[UIImage imageNamed:@"movie.png"]];
    UINavigationController *lifeNav = [[UINavigationController alloc] initWithRootViewController:[GCLifeViewController new]];
    lifeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"生活" image:nil tag:11];
    [lifeNav.tabBarItem setImage:[UIImage imageNamed:@"life.png"]];
    NSMutableArray *itemsArr = [NSMutableArray arrayWithObjects:homeNav,mainNav,lifeNav,nil];
    _tabBarController = [UITabBarController new];
    _tabBarController.delegate = self;
    [_tabBarController setViewControllers:itemsArr];
    _tabBarController.selectedIndex = 0;
    _tabBarController.selectedViewController = [_tabBarController.viewControllers objectAtIndex:0];
    self.window.rootViewController = _tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
