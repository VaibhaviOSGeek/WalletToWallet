//
//  LoginViewController.m
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize Usertxt=_Usertxt;
@synthesize Passtxt=_Passtxt;

+(LoginViewController *)initViewControllerUsername:(NSString *)username{
    LoginViewController * login;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        login =[[LoginViewController alloc]initWithNibName:@"LoginViewController_iPad" bundle:[NSBundle mainBundle]];
        
    }else{
       login =[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    }
    
    login.username = username;
    return login;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    _Usertxt.text = self.username;
    _userIconView.layer.borderWidth= 1.0;
    _userIconView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _passIconView.layer.borderWidth= 1.0;
    _passIconView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width,450);
}

-(void)loginClicked:(id)sender
{
    WalletToWalletAccount *account = [[WalletToWalletAccount alloc] init];
    NSString * Username = _Usertxt.text;
    NSString * Password = _Passtxt.text;
    
    if (Username.length <= 0 || Password.length <= 0 ) {
        UIAlertView * alrt = [[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter valid information to Login!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alrt show];
        // [self.delegate UserDidLogin:self];
    return;
    }
    
    [[ActivityIndicator currentIndicator]displayActivity:@"Logging In..."];
    [account authenticatedWithUserName:Username andPassword:Password withDelegate:self];
}
-(void)forgotPassword:(id)sender{
    ForgotPasswordViewController * forgot =[ForgotPasswordViewController initViewController];
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:forgot];
    navControl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController presentViewController:navControl animated:YES completion:nil];
}
-(void)dontHaveAccountClicked:(id)sender{
    RegistrationViewController * registration =[RegistrationViewController initViewController];
    UINavigationController *navControl = [[UINavigationController alloc] initWithRootViewController:registration];
    navControl.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController presentViewController:navControl animated:YES completion:nil];
}

- (void)accountAuthenticatedWithAccount:(WalletToWalletAccount *)account {
    [AccountManager Instance].activeAccount = account;
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:_Usertxt.text forKey:@"UserName"];
    
    [[ActivityIndicator currentIndicator] displayCompleted];
    
    [self.delegate UserDidLogin:self];
}
- (void)accountDidFailAuthentication:(NSError *)error {
    [[ActivityIndicator currentIndicator] displayCompletedWithError:@"Fail"];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:nil
                                                     message:@"TimeOut Error !"
                                                    delegate:nil
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
    
    
    
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
