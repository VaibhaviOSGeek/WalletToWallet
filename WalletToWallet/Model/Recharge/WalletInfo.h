//
//  WalletInfo.h
//  WalletToWallet
//
//  Created by harish on 06/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletToWalletRequest.h"
#import "Constant.h"
#import "WalletToWalletURLSchema.h"
#import "WalletToWalletRequestDelegate.h"
#import "ModelListDelegate.h"
#import "AccountManager.h"

@interface WalletInfo : NSObject<WalletToWalletRequestDelegate>
{
    NSString * _account_name;
}

@property (nonatomic ,retain) NSString * account_name;

@property (nonatomic ,retain) id<ModelListDelegate> modelListDelegate;
+ (WalletInfo *)instance;
- (void)getWalletAccountNameByAccountNo:(NSString *)accountNo ModelDelegate:(id<ModelListDelegate>)delegate;

@end
