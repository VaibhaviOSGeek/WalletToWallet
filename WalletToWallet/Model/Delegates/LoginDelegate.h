//
//  LoginDelegate.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LoginViewController;
@protocol LoginDelegate <NSObject>

-(void)UserDidLogin:(LoginViewController *)login;

@end
