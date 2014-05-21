//
//  ListConciergeServicesViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ListConciergeServicesViewController.h"

@interface ListConciergeServicesViewController ()

@end

@implementation ListConciergeServicesViewController
@synthesize webView=_webView;

+(ListConciergeServicesViewController *)initViewController{
    ListConciergeServicesViewController * recharge =[[ListConciergeServicesViewController alloc]initWithNibName:@"ListConciergeServicesViewController" bundle:[NSBundle mainBundle]];
    recharge.title =@"Concierge Services";
    return recharge;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[MyBalanceList instance].redirectUrl]]];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[ActivityIndicator currentIndicator]displayCompleted];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [[ActivityIndicator currentIndicator]displayActivity:@"Loading..."];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[ActivityIndicator currentIndicator]displayCompleted];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [[ActivityIndicator currentIndicator]displayCompletedWithError:@"Fail."];
}


-(void)ModelListLoadFailWithError:(NSString *)error{

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
