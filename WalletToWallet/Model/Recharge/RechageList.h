//
//  RechageList.h
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WalletToWalletRequest.h"
#import "Constant.h"
#import "WalletToWalletURLSchema.h"
#import "WalletToWalletRequestDelegate.h"
#import "ModelListDelegate.h"
#import "AccountManager.h"
#import "RechageInfo.h"
#import "WalletTrasferChargeInfo.h"
#import "MyBalanceList.h"
#import "ActivityIndicator.h"

@interface RechageList : NSObject<WalletToWalletRequestDelegate>
{
    id<ModelListDelegate> _modelListDelegate;
    NSMutableArray * _rechangeArray;
    NSMutableArray * walletTrasferArray;
    NSString * _redirectUrl;
}
@property (nonatomic ,retain) id<ModelListDelegate> modelListDelegate;
@property (nonatomic ,retain) NSMutableArray * rechangeArray;
@property (nonatomic ,retain) NSMutableArray * walletTrasferArray;
@property (nonatomic ,retain) NSString * redirectUrl;

+ (RechageList *)instance;
- (NSMutableArray *)getRechangeList;

- (NSString *)getWalletAccountName;
- (void)getMyBalanceByUserId:(id<ModelListDelegate>)delegate;
- (void)rechargeWalletByAmount:(float)amount ModelDelegate:(id<ModelListDelegate>)delegate;
- (void)wallet_transfer_fund_chargesByAmount:(NSString *)amount ModelDelegate:(id<ModelListDelegate>)delegate;
- (void)wallet_recharge_confirmAccount_no:(NSString *)account_no AccountName:(NSString *)accountName Currency:(NSString *)currency ActualAmount:(NSString *)actualAmount Payment_method:(NSString *)payment_method TotalAmount:(NSString *)totalAmount ModelDelegate:(id<ModelListDelegate>)delegate;

- (void)transfer_fund_confirmAccount_no:(NSString *)account_no AccountName:(NSString *)accountName Currency:(NSString *)currency ActualAmount:(NSString *)actualAmount to_account_no:(NSString *)to_account_no TotalAmount:(NSString *)totalAmount account_pin:(NSString *)account_pin ModelDelegate:(id<ModelListDelegate>)delegate;
@end
