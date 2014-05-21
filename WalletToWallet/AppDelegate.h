//
//  AppDelegate.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"
#import "Reachability.h"
#import "LoginDelegate.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate,LoginDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (strong, nonatomic) IBOutlet UINavigationController * navigation;

+ (AppDelegate*)appDelegate;
- (BOOL)isReachable;
- (void) logout;
@end
