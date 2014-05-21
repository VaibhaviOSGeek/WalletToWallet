//
//  SecurityQuestionViewController.m
//  WalletToWallet
//
//  Created by harish on 21/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "SecurityQuestionViewController.h"

@interface SecurityQuestionViewController ()

@end

@implementation SecurityQuestionViewController
@synthesize txtAns1=_txtAns1;
@synthesize txtAns2=_txtAns2;
@synthesize txtViewQue1=_txtViewQue1;
@synthesize txtViewQue2=_txtViewQue2;
@synthesize securityinfo=_securityinfo;


+(SecurityQuestionViewController *)initViewControllerSecurityInfo:(security_questionInfo *)infor{
    SecurityQuestionViewController * security =[[SecurityQuestionViewController alloc]initWithNibName:@"SecurityQuestionViewController" bundle:nil];
    security.title =@"SecurityQuestion";
    security.securityinfo = infor;
    return security;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _txtViewQue1.text = _securityinfo.security_question_one;
    
    _txtViewQue2.text = _securityinfo.security_question_two;
    
    // Do any additional setup after loading the view from its nib.
}
-(void)submitClicked:(id)sender{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
