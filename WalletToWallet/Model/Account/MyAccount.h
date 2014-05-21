//
//  MyAccount.h
//  WalletToWallet
//
//  Created by harish on 03/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ModelListDelegate.h"
#import "WalletToWalletRequest.h"
#import "WalletToWalletAccount.h"
#import "WalletToWalletRequestDelegate.h"
#import "AccountManager.h"


@interface MyAccount : NSObject<WalletToWalletRequestDelegate>{
    NSString * _accountName;
    NSString * _accountNo;
    NSString * _accountCurrency;
    id<ModelListDelegate> _modelListDelegate;
}
@property (nonatomic ,retain) NSString * accountName;
@property (nonatomic ,retain) NSString * accountNo;
@property (nonatomic ,retain) NSString * accountCurrency;
@property (nonatomic ,retain) id<ModelListDelegate> modelListDelegate;

+(MyAccount*)Instance;

- (void)getMyAccountDetailWithDelegate:(id<ModelListDelegate>)delegate;



@end
