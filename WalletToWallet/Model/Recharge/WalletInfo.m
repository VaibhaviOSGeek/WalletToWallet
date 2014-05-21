//
//  WalletInfo.m
//  WalletToWallet
//
//  Created by harish on 06/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletInfo.h"
static WalletInfo * Singleton =nil;
@implementation WalletInfo
@synthesize account_name=_account_name;


+(WalletInfo *)instance{
    if (Singleton == nil) {
        Singleton = [[WalletInfo alloc]init];
    }
    return Singleton;
}

-(id)init
{self = [super init];
    if (self) {
        _modelListDelegate=nil;
    }
    return self;
}

-(NSString *)getWalletAccountName{
    return _account_name;
}

-(void)getWalletAccountNameByAccountNo:(NSString *)accountNo ModelDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate =delegate;
    
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:GET_WALLET_ACCOUNT_NAME andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    [request setParameter:accountNo forKey:@"account_no"];
    request.Tag = GET_WALLET_ACCOUNT_NAME;
    [request startRequest];
    
}

#pragma mark -WalletToWalletRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request{
    
    if ([request.Tag isEqual:GET_WALLET_ACCOUNT_NAME]){
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        _account_name = [mainDict objectForKey:@"account_name"];
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
