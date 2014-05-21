//
//  ReportList.h
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
#import "RewordReportInfo.h"
@interface ReportList : NSObject<WalletToWalletRequestDelegate>
{
    id<ModelListDelegate> _modelListDelegate;
    NSMutableArray * _reportArray;
    NSMutableArray * _rewardCurrencyArray;
}
@property (nonatomic ,retain) id<ModelListDelegate> modelListDelegate;
@property (nonatomic ,retain) NSMutableArray * reportArray;
@property (nonatomic ,retain) NSMutableArray * rewardCurrencyArray;
+ (ReportList *)instance;
- (NSMutableArray *)getRewardReportList;
- (NSMutableArray *)getRewardCurrencyList;
- (void)getRewardReportListByPage:(int)page Delegate:(id<ModelListDelegate>)delegate;
- (void)getRewardCurrencyListByPage:(int)page Delegate:(id<ModelListDelegate>)delegate;

@end
