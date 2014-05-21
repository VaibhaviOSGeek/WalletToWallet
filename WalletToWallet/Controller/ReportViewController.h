//
//  ReportViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalletReportViewController.h"
#import "RewardViewController.h"
#import "RewardCurrencyReportViewController.h"
@interface ReportViewController : UIViewController


+(ReportViewController *)initViewController;

- (IBAction)walletReportClicked:(id)sender;
- (IBAction)rewardsReportClicked:(id)sender;
- (IBAction)RewardsCurrencyReportClicked:(id)sender;

@end
