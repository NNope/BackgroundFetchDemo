//
//  AppDelegate.m
//  Background Fetch
//
//  Created by 谈Xx on 16/4/19.
//  Copyright © 2016年 谈Xx. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 对应用的UIApplication实例设置获取间隔，一般在应用启动的时候调用以下代码即可：
    // UIApplicationBackgroundFetchIntervalMinimum尽可能频繁的
    // 但不代表肯定隔这段时间就会获取，是在这段时间的肯定不会获取
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    return YES;
}

// 需要实现这个方法 系统将会在执行fetch的时候调用这个方法
-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    UINavigationController *navigationController = (UINavigationController*)self.window.rootViewController;
    
    // 需要通知系统结果 completionHandler
    id fetchViewController = navigationController.topViewController;
    if ([fetchViewController respondsToSelector:@selector(fetchDataResultHandler:)])
    {
        [fetchViewController fetchDataResultHandler:^(NSError *error, NSArray *results){
            if (!error)
            {
                if (results.count != 0)
                {
                    //Update UI with results.
                    //Tell system all done.
                    completionHandler(UIBackgroundFetchResultNewData);
                }
                else
                {
                    completionHandler(UIBackgroundFetchResultNoData);
                }
            }
            else
            {
                completionHandler(UIBackgroundFetchResultFailed);
            }
        }];
    }
    else
    {
        completionHandler(UIBackgroundFetchResultFailed);
    }
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
