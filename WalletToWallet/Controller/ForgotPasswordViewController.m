//
//  ForgotPasswordViewController.m
//  WalletToWallet
//
//  Created by harish on 05/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ForgotPasswordViewController.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController
@synthesize txtEmail=_txtEmail;

+(ForgotPasswordViewController *)initViewController{
    ForgotPasswordViewController * forgot;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
         forgot =[[ForgotPasswordViewController alloc]initWithNibName:@"ForgotPasswordViewController_iPad" bundle:[NSBundle mainBundle]];
    }
    else
    {
        forgot =[[ForgotPasswordViewController alloc]initWithNibName:@"ForgotPasswordViewController" bundle:[NSBundle mainBundle]];
    }
    
    forgot.title =@"Forgot";
    return forgot;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * logOutBarButton =[[UIBarButtonItem alloc]initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(logOutBarButtonClicked:)];
    self.navigationItem.leftBarButtonItem = logOutBarButton;
   
    
    // Do any additional setup after loading the view from its nib.
}
-(void)logOutBarButtonClicked:(id)sender{
      self.navigationController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(void)submitClicked:(id)sender{
    if (!(_txtEmail.text.length > 0)) {
    
        UIAlertView * alert= [[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter valid email!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
        
    }else{
        if (![Utility validateEmailWithString:_txtEmail.text]) {
            UIAlertView * alert= [[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter valid email!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
            _txtEmail.text=@"";
            return;
            
        }
        
        WalletToWalletAccount *account = [[WalletToWalletAccount alloc] init];
        [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
        [account forgotPasswordAccount:_txtEmail.text AccountDelegate:self];
        

    }
    
    
}
-(void)DataPostToServerSuccessfully:(WalletToWalletRequest *)responce{
    [[ActivityIndicator currentIndicator]displayCompleted];
     NSDictionary *dict = responce.responseData;
    NSDictionary *result = [dict objectForKey:@"parameters"];
    if (result) {
        security_questionInfo * info =[[security_questionInfo alloc]init];
        
        if ([result objectForKey:@"security_question_one"]) {
            info.security_question_one = [result objectForKey:@"security_question_one"];
        }
        if ([result objectForKey:@"security_question_one_answer"]) {
            info.security_question_one_answer = [result objectForKey:@"security_question_one_answer"];
        }
        
        if ([result objectForKey:@"security_question_two"]) {
            info.security_question_two = [result objectForKey:@"security_question_two"];
        }
        
        if ([result objectForKey:@"security_question_two_answer"]) {
            info.security_question_two_answer = [result objectForKey:@"security_question_two_answer"];
        }
        
        SecurityQuestionViewController * secirty =[SecurityQuestionViewController initViewControllerSecurityInfo:info];
        [self.navigationController pushViewController:secirty animated:YES];
        
    }
    

}
-(void)DataPostToServerFailWithError:(NSString *)error{
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
