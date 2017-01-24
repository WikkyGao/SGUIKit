//
//  AppDelegate.m
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import "AppDelegate.h"
#import "UIKitViewController.h"
#import "UIAnimationViewController.h"
@interface AppDelegate ()
{
    UIKitViewController             *UIKit;
    UIAnimationViewController      *animation;
}
@property (nonatomic,strong)UITabBarController *tabbar;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setTabbar];
    
    return YES;
}


- (void)setTabbar{
    _tabbar = [UITabBarController new];
    UIKit = [UIKitViewController new];
    UIKit.title = @"UIKit";
    
    animation = [[UIAnimationViewController alloc]init];
    animation.title = @"动画";
    
    UINavigationController *navUIKit = [[UINavigationController alloc]initWithRootViewController:UIKit];
    UINavigationController *navAnimation = [[UINavigationController alloc]initWithRootViewController:animation];
    //    UIImage *img = [UIImage imageNamed:@"home_active"];
    
    UIImage *imgHomeUnactive =[UIImage imageNamed:@"uikit_unactive"];
    UIImage *imgHomeActive = [UIImage imageNamed:@"uikit"];
    imgHomeActive = [imgHomeActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *imgAnimationUnactive =[UIImage imageNamed:@"animation_unactive"];
    UIImage *imgAnimationActive = [UIImage imageNamed:@"animation"];
    imgAnimationActive = [imgAnimationActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UIImage *imgMemberUnactive =[UIImage imageNamed:@"member_unactive"];
    UIImage *imgMemberActive = [UIImage imageNamed:@"member_active"];
    imgMemberUnactive = [imgMemberUnactive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imgMemberActive = [imgMemberActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *imgDiscoverUnactive =[UIImage imageNamed:@"discover_unactive"];
    UIImage *imgDiscoverActive = [UIImage imageNamed:@"discover_active"];
    imgDiscoverUnactive = [imgDiscoverUnactive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    imgDiscoverActive = [imgDiscoverActive imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    navUIKit.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"UIKit" image:imgHomeUnactive selectedImage:imgHomeActive];
    navAnimation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"动画" image:imgAnimationUnactive selectedImage:imgAnimationActive];

    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"iconfont" size:12],NSFontAttributeName,nil]];
    [[UINavigationBar appearance] setTranslucent:YES];
    UIColor *titleHighlightedColor = K_default_color;

    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor colorWithHexString:@"#888888"], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    NSArray *controllers = @[navUIKit,navAnimation];
    _tabbar.viewControllers =controllers;
//    _tabbar.tabBar.translucent = NO;
    _tabbar.tabBar.barTintColor = [UIColor colorWithHexString:@"#eeeeee"];
    self.window.rootViewController = _tabbar;

    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].barTintColor = K_default_color;

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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"SGUIKit"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
