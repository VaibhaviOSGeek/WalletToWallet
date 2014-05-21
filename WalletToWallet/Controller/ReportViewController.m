//
//  ReportViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController

+(ReportViewController *)initViewController{
    ReportViewController * recharge;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    { recharge =[[ReportViewController alloc]initWithNibName:@"ReportViewController_iPad" bundle:[NSBundle mainBundle]];
    }
    else
    {
         recharge =[[ReportViewController alloc]initWithNibName:@"ReportViewController" bundle:[NSBundle mainBundle]];
    }
   
    recharge.title =@"Report";
    return recharge;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)walletReportClicked:(id)sender{
    WalletReportViewController * wallet =[WalletReportViewController initViewController];
    [self.navigationController pushViewController:wallet animated:YES];
}
-(void)rewardsReportClicked:(id)sender{
    RewardViewController * reward =[RewardViewController initViewController];
    [self.navigationController pushViewController:reward animated:YES];

}
-(void)RewardsCurrencyReportClicked:(id)sender{
    RewardCurrencyReportViewController * reward =[RewardCurrencyReportViewController initViewController];
    [self.navigationController pushViewController:reward animated:YES];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
