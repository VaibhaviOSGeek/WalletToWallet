//
//  ReportList.m
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ReportList.h"
static ReportList * Singleton =nil;
@implementation ReportList
@synthesize reportArray=_reportArray;
@synthesize modelListDelegate=_modelListDelegate;

+(ReportList *)instance{
    if (Singleton == nil) {
        Singleton = [[ReportList alloc]init];
    }
    return Singleton;
}

-(id)init
{self = [super init];
    if (self) {
        _reportArray=[[NSMutableArray alloc]init];
        _rewardCurrencyArray =[[NSMutableArray alloc]init];
        _modelListDelegate=nil;
    }
    return self;
}
-(NSMutableArray *)getRewardReportList{
    return _reportArray;
}
-(NSMutableArray *)getRewardCurrencyList{
    return _rewardCurrencyArray;
}
-(void)getRewardReportListByPage:(int)page Delegate:(id<ModelListDelegate>)delegate {
    _modelListDelegate=delegate;
    if (_reportArray.count <= 0) {
        WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:MY_REWARDS andDelegate:self andMethod:POST];
        WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
        [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
        [request setParameter:[NSNumber numberWithInt:page] forKey:@"p"];
        request.Tag = MY_REWARDS;
        [request startRequest];
    }else{
        [_modelListDelegate ModelListLoadedSuccessfully];
    }
}
-(void)getRewardCurrencyListByPage:(int)page Delegate:(id<ModelListDelegate>)delegate{
    _modelListDelegate=delegate;
    if (_rewardCurrencyArray.count <= 0) {
        WalletToWalletRequest * request =[[WalletToWalletRequest alloc]initWithApiMethod:MY_REWARD_CURRENCUY andDelegate:self andMethod:POST];
        WalletToWalletAccount * account =[AccountManager Instance].activeAccount;
        [request setParameter:[NSNumber numberWithInt:17] forKey:@"uid"];
        [request setParameter:[NSNumber numberWithInt:page] forKey:@"p"];
        request.Tag = MY_REWARD_CURRENCUY;
        [request startRequest];
    }else{
        [_modelListDelegate ModelListLoadedSuccessfully];
    }

}
#pragma mark -WalletToWalletRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request{
    if ([request.Tag  isEqual: MY_REWARDS]) {
        _reportArray=[[NSMutableArray alloc]init];
        
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        
        NSArray* array = [mainDict objectForKey:@"rewards"];
        
        if (array && array.count >0) {
            for (NSDictionary * rewardDict in array) {
                RewordReportInfo * report =[RewordReportInfo parseWithDictionary:rewardDict];
                [_reportArray addObject:report];
            }
        }
        
    }else if ([request.Tag  isEqual: MY_REWARD_CURRENCUY]){
        _rewardCurrencyArray=[[NSMutableArray alloc]init];
        
        NSDictionary * mainDict=[request.responseData objectForKey:@"parameters"];
        
        NSArray* array = [mainDict objectForKey:@"reward_currency"];
        
        if (array && array.count >0) {
            for (NSDictionary * rewardDict in array) {
                RewordReportInfo * report =[RewordReportInfo parseWithDictionary:rewardDict];
                [_rewardCurrencyArray addObject:report];
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
