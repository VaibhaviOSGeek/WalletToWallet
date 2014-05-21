//
//  ChangePasswordViewController.m
//  WalletToWallet
//
//  Created by harish on 21/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

@synthesize email=_email;
@synthesize nw_passwd=_nw_passwd;
@synthesize reEnter_pwd=_reEnter_pwd;
+(ChangePasswordViewController*)viewController
{
    ChangePasswordViewController *changePwd;
    
        changePwd=[[ChangePasswordViewController alloc]initWithNibName:@"ChangePasswordViewController" bundle:nil];
    
    
    changePwd.title=@"Change Password";
    return changePwd;
}

-(void)saveNewPassword:(id)sender
{
    if ([self.email.text isEqualToString:@""]|[self.nw_passwd.text isEqualToString:@""]|[self.reEnter_pwd.text isEqualToString:@""])
    {
        
        
        NSString *message=@"Please Enter Valid Information to Proceed";
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        
    }
    else
    {
        if ([self.nw_passwd.text isEqualToString:self.reEnter_pwd.text])
        {
             WalletToWalletAccount *account = [[WalletToWalletAccount alloc] init];
            [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
            [account changePasswordAccount:_email.text Password:_nw_passwd.text AccountDelegate:self];
        }
        else
        {
            NSString *message=@"Your Re-Entered Password does not match to the New password";
            UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alrt show];
        }
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark -UniversalDelegate
-(void)DataPostToServerSuccessfully:(WalletToWalletRequest *)responce{
    [[ActivityIndicator currentIndicator] displayCompleted];

    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:[responce.responseData objectForKey:@"description"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    
    
    
}

#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [[AppDelegate appDelegate]logout];
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
