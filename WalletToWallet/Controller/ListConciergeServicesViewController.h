//
//  ListConciergeServicesViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityIndicator.h"
#import "ModelListDelegate.h"
#import "MyBalanceList.h"

@interface ListConciergeServicesViewController : UIViewController<ModelListDelegate,UIWebViewDelegate>{
 IBOutlet UIWebView * _webView;
}

@property (nonatomic ,retain) UIWebView * webView;
+(ListConciergeServicesViewController *)initViewController;
@end
