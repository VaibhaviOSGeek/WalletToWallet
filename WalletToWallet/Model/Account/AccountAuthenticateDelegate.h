//
//  AccountAuthenticateDelegate.h
//  CourseKart
//
//  Created by Samir Kha on 05/04/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WalletToWalletAccount;
@protocol AccountAuthenticateDelegate <NSObject>

-(void)accountAuthenticatedWithAccount:(WalletToWalletAccount*) account;
-(void)accountDidFailAuthentication:(NSError*) error;

@end
