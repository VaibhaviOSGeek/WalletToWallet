//
//  MyBalanceList.m
//  WalletToWallet
//
//  Created by harish on 20/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "MyBalanceList.h"
static MyBalanceList * Singleton =nil;
@implementation MyBalanceList
@synthesize user_balance=_user_balance;
@synthesize formatted_balance=_formatted_balance;
@synthesize user_currency=_user_currency;
@synthesize redirectUrl=_redirectUrl;

/*
 user_balance: "37472.5"
 formatted_balance: "&#8358;37,472.50"
 user_currency: "NGN"
 */

+(MyBalanceList *)instance{
    if (Singleton == nil) {
        Singleton = [[MyBalanceList alloc]init];
    }
    return Singleton;
}
-(void)getMyBalanceDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate=delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:BALANCE andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    request.Tag = BALANCE;
    [request startRequest];
}

//specialoffer
//concierge
-(void)getSpecialOfferDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate=delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:SPECIAL_OFFER andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    request.Tag = SPECIAL_OFFER;
    [request startRequest];
}


-(void)getConciergeeDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate=delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:CONCIERGE andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    request.Tag = CONCIERGE;
    [request startRequest];
}

#pragma mark -WalletToWalletRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request{
    
    if ([request.Tag  isEqual: BALANCE]) {
       NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        if ([mainDict objectForKey:@"user_balance"]) {
            _user_balance =[mainDict objectForKey:@"user_balance"];
        }
        if ([mainDict objectForKey:@"formatted_balance"]) {
            _formatted_balance =[mainDict objectForKey:@"formatted_balance"];
        }
        if ([mainDict objectForKey:@"user_currency"]) {
            _user_currency =[mainDict objectForKey:@"user_currency"];
        }
       
    }else if ([request.Tag  isEqual: CONCIERGE]) {
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        if ([mainDict objectForKey:@"redirectUrl"]) {
            _redirectUrl  =  [mainDict objectForKey:@"redirectUrl"];
        }
    }else if ([request.Tag  isEqual: SPECIAL_OFFER]) {
        specialOfferList =[[NSMutableArray alloc]init];
         NSArray * mainDict=[request.responseData objectForKey:@"parameters"];
        if (mainDict && mainDict.count >0) {
            for (NSDictionary * rewardDict in mainDict) {
                SpecialOfferInfo * report =[SpecialOfferInfo parseWithDictionary:rewardDict];
                [specialOfferList addObject:report];
            }
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
