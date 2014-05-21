//
//  WalletToWalletRequestDelegate.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WalletToWalletRequest;
@protocol WalletToWalletRequestDelegate <NSObject>

-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest*) request;
-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest*) request withError:(NSError*) error;
-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest *)request withStringError:(NSString *)error;

@end
