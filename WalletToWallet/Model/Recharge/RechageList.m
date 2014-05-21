//
//  RechageList.m
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RechageList.h"
static RechageList * Singleton =nil;
@implementation RechageList
@synthesize redirectUrl=_redirectUrl;

+(RechageList *)instance{
    if (Singleton == nil) {
        Singleton = [[RechageList alloc]init];
    }
    return Singleton;
}

-(id)init
{self = [super init];
    if (self) {
        _rechangeArray=[[NSMutableArray alloc]init];
        _modelListDelegate=nil;
    }
    return self;
}
-(NSMutableArray *)getRechangeList{
    return _rechangeArray;
}

-(void)rechargeWalletByAmount:(float)amount ModelDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate =delegate;
    
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:WALLET_RECHARGE_CHARGES andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    [request setParameter:[NSNumber numberWithFloat:amount] forKey:@"amount"];
    request.Tag = WALLET_RECHARGE_CHARGES;
    [request startRequest];
}

-(void)wallet_transfer_fund_chargesByAmount:(NSString *)amount ModelDelegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate =delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:WALLET_TRANSFER_FUND_CHARGES andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    [request setParameter:amount forKey:@"amount"];
    request.Tag = WALLET_TRANSFER_FUND_CHARGES;
    [request startRequest];
}
-(void)wallet_recharge_confirmAccount_no:(NSString *)account_no AccountName:(NSString *)accountName Currency:(NSString *)currency ActualAmount:(NSString *)actualAmount Payment_method:(NSString *)payment_method TotalAmount:(NSString *)totalAmount ModelDelegate:(id<ModelListDelegate>)delegate

{
    _modelListDelegate =delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:WALLET_RECHARGE_CONFIRM andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    [request setParameter:account_no forKey:@"account_no"];
    [request setParameter:accountName forKey:@"account_name"];
    [request setParameter:currency forKey:@"currency"];
    [request setParameter:actualAmount forKey:@"actual_amount"];
    [request setParameter:@"pay using card" forKey:@"payment_method"];
    [request setParameter:@"38" forKey:@"total_amount"];
    //[MyBalanceList instance].user_balance
    
    request.Tag = WALLET_RECHARGE_CONFIRM;
    [request startRequest];

}

-(void)transfer_fund_confirmAccount_no:(NSString *)account_no AccountName:(NSString *)accountName Currency:(NSString *)currency ActualAmount:(NSString *)actualAmount to_account_no:(NSString *)to_account_no TotalAmount:(NSString *)totalAmount account_pin:(NSString *)account_pin ModelDelegate:(id<ModelListDelegate>)delegate{

    _modelListDelegate =delegate;
    WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:TRANSFER_FUND_CONFIRM andDelegate:self andMethod:POST];
    WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
    
    [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
    [request setParameter:account_no forKey:@"account_no"];
    [request setParameter:accountName forKey:@"account_name"];
    [request setParameter:currency forKey:@"currency"];
    [request setParameter:actualAmount forKey:@"actual_amount"];
    [request setParameter:to_account_no forKey:@"to_account_no"];
    [request setParameter:totalAmount forKey:@"total_amount"];
     [request setParameter:account_pin forKey:@"account_pin"];
    
    request.Tag = TRANSFER_FUND_CONFIRM;
    [request startRequest];

    /*
     required   fields :- uid (POST method) , account_no (POST method) ,account_name (POST method)
     , currency (POST method), actual_amount (POST method) , to_account_no (POST method) , total_amount (POST method) , account_pin (POST method)
     
     */

}

#pragma mark -WalletToWalletRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request{
    //charges
    //redirectUrl
    if ([[request.responseData objectForKey:@"code"]intValue] == 50) {
        [[ActivityIndicator currentIndicator]displayCompleted];
        UIAlertView * alert =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:[request.responseData objectForKey:@"description"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    if ([request.Tag isEqual:TRANSFER_FUND_CONFIRM]){
      
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        /*if ([mainDict objectForKey:@"redirectUrl"]) {
            _redirectUrl = [mainDict objectForKey:@"redirectUrl"];
        }*/
    }else if ([request.Tag isEqual:WALLET_RECHARGE_CONFIRM]){
        
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        if ([mainDict objectForKey:@"redirectUrl"]) {
            _redirectUrl = [mainDict objectForKey:@"redirectUrl"];
        }
    }else if ([request.Tag isEqual:WALLET_TRANSFER_FUND_CHARGES]){
        _walletTrasferArray =[[NSMutableArray alloc]init];
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        
        NSArray* array = [mainDict objectForKey:@"charges"];
        
        if (array && array.count >0) {
            for (NSDictionary * rewardDict in array) {
                WalletTrasferChargeInfo * recharge =[WalletTrasferChargeInfo parseWithDictionary:rewardDict];
                [_walletTrasferArray addObject:recharge];
            }
        }
    }else if ([request.Tag  isEqual: BALANCE]) {
        
    }else if ([request.Tag isEqual:WALLET_RECHARGE_CHARGES]){
        _rechangeArray =[[NSMutableArray alloc]init];
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        
        NSArray* array = [mainDict objectForKey:@"charges"];
        
        if (array && array.count >0) {
            for (NSDictionary * rewardDict in array) {
                RechageInfo * recharge =[RechageInfo parseWithDictionary:rewardDict];
                [_rechangeArray addObject:recharge];
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
