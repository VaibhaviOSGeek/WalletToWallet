//
//  ChangePasswordViewController.h
//  WalletToWallet
//
//  Created by harish on 21/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelListDelegate.h"
#import "ActivityIndicator.h"
#import "Constant.h"
#import "WalletToWalletAccount.h"
@interface ChangePasswordViewController : UIViewController
<UniversalDelegate,UIAlertViewDelegate>
{
    IBOutlet UITextField *_email;
    IBOutlet UITextField *_nw_passwd;
    IBOutlet UITextField *_reEnter_pwd;
    
}
-(IBAction)saveNewPassword:(id)sender;

@property(nonatomic,retain)UITextField *email;

@property(nonatomic,retain)UITextField *nw_passwd;

@property(nonatomic,retain)UITextField *reEnter_pwd;

+(ChangePasswordViewController*)viewController;

@end
