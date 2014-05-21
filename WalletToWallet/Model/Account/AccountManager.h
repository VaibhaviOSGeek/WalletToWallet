//
//  AccountManager.h
//  AccountManager
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletToWalletAccount.h"
#import "ModelListDelegate.h"

@interface AccountManager : NSObject
{
    WalletToWalletAccount *_activeAccount;
    
    NSMutableDictionary *_savedAccounts;
}

@property (nonatomic, readwrite, retain) WalletToWalletAccount *activeAccount;

+(AccountManager*)Instance;

-(void)saveAccount;

- (void)getMyAccountDetailWithDelegate:(id<ModelListDelegate>)delegate;



@end
