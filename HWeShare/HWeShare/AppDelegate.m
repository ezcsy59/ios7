//
//  AppDelegate.m
//  HWeShare
//
//  Created by mac on 13-12-24.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "AKTabBarController.h"
#import "TestViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "SearchVC.h"
#import "HotVC.h"

#import "IndexVC.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    
//    [self setupTabBarController];
    // If the device is an iPad, we make it taller.
    _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 70 : 50];
    [_tabBarController setMinimumHeightToDisplayTitle:40.0];
    
    
    SearchVC *seach=[[SearchVC alloc] init];
    
    UINavigationController *nav= [[UINavigationController alloc] initWithRootViewController:seach];

    
    
    HotVC *h=[[HotVC alloc] init];
    UINavigationController *hot= [[UINavigationController alloc] initWithRootViewController:h];
    
    IndexVC *in=[[IndexVC alloc] init];
    UINavigationController *index= [[UINavigationController alloc] initWithRootViewController:in];
    
    nav.navigationBar.tintColor= [UIColor darkGrayColor];
    hot.navigationBar.tintColor= [UIColor darkGrayColor];
    [_tabBarController setViewControllers:[NSMutableArray arrayWithObjects:
                                                nav,index,[[FourthViewController alloc] init],hot,nil]];
    // Tab background Image
    [_tabBarController setBackgroundImageName:@"noise-dark-gray.png"];
    [_tabBarController setSelectedBackgroundImageName:@"noise-dark-blue.png"];
    
    [_window setRootViewController:_tabBarController];              
    
    [self.window makeKeyAndVisible];
    return YES;
}

//-(void)setupTabBarController
//{
//    CRTabBarController *tabBarController = [[CRTabBarController alloc] init];
//    //视图数组
//    
//    
//    
//    NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
//    
//    UIViewController *crCategoriesslidingViewController = [[UIViewController alloc] init];
//    //导航控制器
//    UINavigationController *categoriesNavigationController = [[UINavigationController alloc] initWithRootViewController:crCategoriesslidingViewController];
//    
//    //首页
//    UITabBarItem* tabBarItem = [[UITabBarItem alloc] init];
//    [tabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_home_ON"]
//              withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_home"]];
//    categoriesNavigationController.view.backgroundColor = [UIColor lightGrayColor];
//    [categoriesNavigationController setTabBarItem: tabBarItem];
//    [viewControllers addObject:categoriesNavigationController];
//    
//    
//    //收藏
//    UIViewController *crSavedProductsController = [[UIViewController alloc] init];
//    UINavigationController *savedNavigationController = [[UINavigationController alloc] initWithRootViewController:crSavedProductsController];
//    UITabBarItem* savedTabBarItem = [[UITabBarItem alloc] init];
//    [savedTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_saved_ON"]
//                   withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_saved"]];
//    crSavedProductsController.view.backgroundColor = [UIColor purpleColor];
//    [savedNavigationController setTabBarItem: savedTabBarItem];
//    [viewControllers addObject:savedNavigationController];
//    
//    
//    
//    GoodsViewController *crSearchController = [[GoodsViewController alloc] init ];
//    UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:crSearchController];
//    UITabBarItem* searchTabBarItem = [[UITabBarItem alloc] init];
//    [searchTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_tab_search_ON"]
//                    withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_tab_search"]];
////    crSearchController.view.backgroundColor = [UIColor brownColor];
//    [searchNavigationController setTabBarItem: searchTabBarItem];
//    [viewControllers addObject:searchNavigationController];
//    
//    
//    
//    UIViewController *crRecentProductsController = [[UIViewController alloc] init ];
//    UINavigationController *recentNavigationProductsController = [[UINavigationController alloc] initWithRootViewController:crRecentProductsController];
//    UITabBarItem* recentTabBarItem = [[UITabBarItem alloc] init];
//    [recentTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_recent_ON"]
//                    withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_recent"]];
//    crRecentProductsController.view.backgroundColor = [UIColor redColor];
//    [recentNavigationProductsController setTabBarItem: recentTabBarItem];
//    [viewControllers addObject:recentNavigationProductsController];
//    
//    UIViewController *crAccountsController = [[UIViewController alloc] init ];
//    UINavigationController *accountsNavigationController = [[UINavigationController alloc] initWithRootViewController:crAccountsController];
//    UITabBarItem* accountTabBarItem = [[UITabBarItem alloc] init];
//    [accountTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_account_ON"]
//                     withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_account"]];
//    crAccountsController.view.backgroundColor = [UIColor yellowColor];
//    [accountsNavigationController setTabBarItem: accountTabBarItem];
//    [viewControllers addObject:accountsNavigationController];
//    
//    UIViewController *crBrandsViewController = [[UIViewController alloc] init ];
//    UINavigationController *brandsNavigationController = [[UINavigationController alloc] initWithRootViewController:crBrandsViewController];
//    UITabBarItem *brandsTabBarItem = [[UITabBarItem alloc] init];
//    [brandsTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_brand_ON"]
//                    withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_brand"]];
//    crBrandsViewController.view.backgroundColor = [UIColor whiteColor];
//    [brandsNavigationController setTabBarItem: brandsTabBarItem];
//    [viewControllers addObject:brandsNavigationController];
//    
//    
//    UIViewController *crAboutController = [[UIViewController alloc] init ];
//    UINavigationController *aboutNavigationController = [[UINavigationController alloc] initWithRootViewController:crAboutController];
//    UITabBarItem* aboutTabBarItem = [[UITabBarItem alloc] init];
//    [aboutTabBarItem  setFinishedSelectedImage: [UIImage imageNamed: @"ICN_tab_info_ON"]
//                   withFinishedUnselectedImage: [UIImage imageNamed: @"ICN_tab_info"]];
//    crAboutController.view.backgroundColor = [UIColor greenColor];
//    [aboutNavigationController setTabBarItem: aboutTabBarItem];
//    [viewControllers addObject:aboutNavigationController];
//    
//	tabBarController.delegate = self;
//	tabBarController.viewControllers = viewControllers;
//    
//    
//    [self.window addSubview:[tabBarController view]];
//    self.window.rootViewController = tabBarController;
//    
//    
//    
//    
//}







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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
