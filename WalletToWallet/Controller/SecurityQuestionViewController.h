//
//  SecurityQuestionViewController.h
//  WalletToWallet
//
//  Created by harish on 21/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "security_questionInfo.h"
@interface SecurityQuestionViewController : UIViewController
{
   IBOutlet UITextField * _txtAns1;
   IBOutlet UITextField * _txtAns2;
   IBOutlet UITextView * _txtViewQue1;
   IBOutlet UITextView * _txtViewQue2;
    security_questionInfo * _securityinfo;
}

+ (SecurityQuestionViewController *)initViewControllerSecurityInfo:(security_questionInfo *)info;

@property (nonatomic ,retain)UITextField * txtAns1;
@property (nonatomic ,retain)UITextField * txtAns2;
@property (nonatomic ,retain)UITextView * txtViewQue1;
@property (nonatomic ,retain)UITextView * txtViewQue2;
@property (nonatomic ,retain)security_questionInfo * securityinfo;

- (IBAction)submitClicked:(id)sender;
@end
