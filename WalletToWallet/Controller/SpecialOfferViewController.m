//
//  SpecialOfferViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "SpecialOfferViewController.h"

@interface SpecialOfferViewController ()

@end

@implementation SpecialOfferViewController

+(SpecialOfferViewController *)initViewController{
    SpecialOfferViewController * recharge =[[SpecialOfferViewController alloc]initWithNibName:@"SpecialOfferViewController" bundle:[NSBundle mainBundle]];
    recharge.title =@"Special Offer";
    return recharge;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
