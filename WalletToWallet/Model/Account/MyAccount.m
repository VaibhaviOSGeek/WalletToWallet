//
//  MyAccount.m
//  WalletToWallet
//
//  Created by harish on 03/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "MyAccount.h"
 static MyAccount* singleton = nil;
@implementation MyAccount

@synthesize modelListDelegate=_modelListDelegate;
@synthesize accountCurrency=_accountCurrency;
@synthesize accountNo=_accountNo;
@synthesize accountName=_accountName;

+(MyAccount*)Instance
{
    if (singleton == nil)
        singleton = [[MyAccount alloc] init];
    
    return singleton;
}
-(id)init
{self = [super init];
    if (self) {
        _modelListDelegate=nil;
    }
    return self;
}

-(void)getMyAccountDetailWithDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate=delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:MY_ACCOUNT andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    request.Tag = MY_ACCOUNT;
    [request startRequest];
}

#pragma mark -WalletToWalletRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request{
    if ([request.Tag  isEqual: MY_ACCOUNT]) {
    
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        
        if ([mainDict objectForKey:@"account_name"]) {
            self.accountName = [mainDict objectForKey:@"account_name"];
        }
        if ([mainDict objectForKey:@"account_no"]) {
            self.accountNo = [mainDict objectForKey:@"account_no"];
        }
        if ([mainDict objectForKey:@"account_currency"]) {
            self.accountCurrency = [mainDict objectForKey:@"account_currency"];
        }
    }
    
    if (_modelListDelegate && [_modelListDelegate respondsToSelector:@selector(ModelListLoadedSuccessfully)]) {
        [_modelListDelegate ModelListLoadedSuccessfully];
    }
    
}
-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest *)request withError:(NSError *)error{
    if (_modelListDelegate && [_modelListDelegate respondsToSelector:@selector(ModelListLoadFailWithError:)]) {
        [_modelListDelegate ModelListLoadFailWithError:request.message];
        
    }
}
-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest *)request withStringError:(NSString *)error{
    if (_modelListDelegate && [_modelListDelegate respondsToSelector:@selector(ModelListLoadFailWithError:)]) {
        [_modelListDelegate ModelListLoadFailWithError:error];
    }
}

@end
