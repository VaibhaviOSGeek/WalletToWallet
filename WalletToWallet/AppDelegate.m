//
//  AppDelegate.m
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "AppDelegate.h"
#import "AccountManager.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([AccountManager Instance].activeAccount == nil) {
        [self showLogin:NO];
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

+(AppDelegate*)appDelegate
{
    return (AppDelegate*)[[UIApplication sharedApplication] delegate];
}
- (BOOL)isReachable {
    Reachability *reach =[Reachability reachabilityWithHostname:@"www.google.com"];
    return [reach isReachable];
}

- (void)showLogin:(BOOL)animated {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * username;
    if ([userDefaults objectForKey:@"UserName"]) {
        username = [userDefaults objectForKey:@"UserName"];
    }
    LoginViewController *login = [LoginViewController initViewControllerUsername:username];
    login.delegate = self;
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:login];
    navControl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigation presentViewController:navControl animated:animated completion:nil];
}

- (void) logout
{
    [AccountManager Instance].activeAccount = nil;
    [self showLogin:TRUE];
    
    
}

-(void)UserDidLogin:(LoginViewController *)login
{
    [self.navigation dismissViewControllerAnimated:YES completion:nil];
}

-(void)reachabilityChanged:(NSNotification*)note
{
    Reachability * reach = [note object];
    
    if([reach isReachable])
    {
        NSLog(@"INTERNET CONNECTION AVAILABLE");
    }
    else
    {
        NSLog(@"INTERNET CONNECTION IS NOT AVAILABLE");
    }
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
