//
//  AppDelegate.m
//  NSRuntimeDemo
//
//  Created by Rock on 14-5-19.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
#import "Human.h"
#import <objc/runtime.h>
#import "NSArray+Swizzle.h"

@interface Man  : NSObject

+ (void)say;
- (void)say;

@end

@implementation Man

+ (void)say
{}

- (void)say
{
    NSLog(@"manmanman");
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//    SEL func = NSSelectorFromString(@"say");
//    Human *human = [Human new];
//    Man *man = [Man new];
//    /*
//    Class c = NSClassFromString(@"Human");
//    [[[c alloc] init] say];
//    
//    
//    Class b = NSClassFromString(@"Man");
//    
//    [[b new] performSelector:func];
//    [[c new] performSelector:func];
//     */
//    
//    IMP imp1 = [man methodForSelector:func];
//    IMP imp2 = [human methodForSelector:func];
//    imp1(human, func);
//    imp2(man, func);
//    
//    //NSLog(@"SEL = %s",func);
    
    Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    method_exchangeImplementations(ori_Method, my_Method);
    
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    NSString *string = [array lastObject];
    NSLog(@"Test Result: %@",string);
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
