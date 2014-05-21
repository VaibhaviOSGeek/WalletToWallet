//
//  LoginViewController.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginDelegate.h"
#import "AccountAuthenticateDelegate.h"
#import "AccountManager.h"
#import "ActivityIndicator.h"
#import "ModelListDelegate.h"
#import "Constant.h"
#import <QuartzCore/QuartzCore.h>
#import "RegistrationViewController.h"
#import "ForgotPasswordViewController.h"
#import "MyBalanceList.h"
@interface LoginViewController : UIViewController<AccountAuthenticateDelegate>
{
    IBOutlet UITextField * _Usertxt;
    IBOutlet UITextField * _Passtxt;
    id<LoginDelegate> _delegate;
    IBOutlet UIView * _userIconView;
    IBOutlet UIView * _passIconView;
    IBOutlet UIScrollView * scrollView;
}

@property (nonatomic ,retain) UITextField * Usertxt;
@property (nonatomic ,retain) UITextField * Passtxt;
@property (nonatomic ,retain) UIView * textfieldView;
@property (nonatomic, retain, readwrite) NSString *username;
@property (nonatomic, retain, readwrite) id<LoginDelegate> delegate;

+ (LoginViewController *)initViewControllerUsername:(NSString *)username;

- (IBAction)loginClicked:(id)sender;
- (IBAction)dontHaveAccountClicked:(id)sender;
- (IBAction)forgotPassword:(id)sender;
@end
