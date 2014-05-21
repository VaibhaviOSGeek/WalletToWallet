//
//  MyAccountViewController.h
//  WalletToWallet
//
//  Created by harish on 03/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyAccount.h"
#import "ChangePasswordViewController.h"
@interface MyAccountViewController : UIViewController
{
    IBOutlet UITextField * _txtAccountName;
    IBOutlet UITextField * _txtAccountNo;
    IBOutlet UITextField * _txtAccountCurrency;
}
@property (nonatomic ,retain) UITextField * txtAccountName;
@property (nonatomic ,retain) UITextField * txtAccountNo;
@property (nonatomic ,retain) UITextField * txtAccountCurrency;

+ (MyAccountViewController *)initViewController;
- (IBAction)chnagePassword:(id)sender;
@end
