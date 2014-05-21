//
//  UniversalDelegate.h
//  WalletToWallet
//
//  Created by harish on 08/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletToWalletRequest.h"
@protocol UniversalDelegate <NSObject>
-(void)DataPostToServerSuccessfully:(WalletToWalletRequest *)responce;
-(void)DataPostToServerFailWithError:(NSString *)error;

@end
