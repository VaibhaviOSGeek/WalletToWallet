//
//  DashboardViewController.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RechageWalletViewController.h"
#import "WalletToWalletViewController.h"
#import "ReportViewController.h"
#import "SpecialOfferViewController.h"
#import "ListConciergeServicesViewController.h"
#import "MyBalanceList.h"
#import "ModelListDelegate.h"
#import "Utility.h"
#import "MyAccountViewController.h"
#import "MyAccount.h"

#import "PreviewViewController.h"


@interface DashboardViewController : UIViewController<ModelListDelegate>
{
    IBOutlet UILabel * _lblMyBalance;
}
+(DashboardViewController*)initViewController;

@property (nonatomic ,retain) UILabel * lblMyBalance;
- (IBAction)rechargedWalletClicked:(id)sender;
- (IBAction)walletToWalletTransferClicked:(id)sender;
- (IBAction)reportClicked:(id)sender;
- (IBAction)listConciergeServiceClicked:(id)sender;
- (IBAction)specialOfferClicked:(id)sender;
- (IBAction)logOutBarButtonClicked:(id)sender;
- (void)myAccountButtonClicked;
@end
