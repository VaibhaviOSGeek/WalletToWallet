//
//  MyAccountViewController.m
//  WalletToWallet
//
//  Created by harish on 03/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "MyAccountViewController.h"

@interface MyAccountViewController ()

@end

@implementation MyAccountViewController

@synthesize txtAccountCurrency=_txtAccountCurrency;
@synthesize txtAccountName=_txtAccountName;
@synthesize txtAccountNo=_txtAccountNo;

+(MyAccountViewController *)initViewController{
    
    MyAccountViewController * myAccount;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        myAccount =[[MyAccountViewController alloc]initWithNibName:@"MyAccountViewController_IPad" bundle:[NSBundle mainBundle]];}
    else
    {
        myAccount =[[MyAccountViewController alloc]initWithNibName:@"MyAccountViewController" bundle:[NSBundle mainBundle]];
    }
    

    myAccount.title=@"My Account";
    return myAccount;
}
-(void)chnagePassword:(id)sender{
    ChangePasswordViewController * changePassword =[ChangePasswordViewController viewController];
    [self.navigationController pushViewController:changePassword animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _txtAccountName.text = [MyAccount Instance].accountName;
    _txtAccountNo.text = [MyAccount Instance].accountNo;
    _txtAccountCurrency.text = [MyAccount Instance].accountCurrency;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
