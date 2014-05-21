//
//  PreviewViewController.h
//  WalletToWallet
//
//  Created by harish on 07/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityIndicator.h"
@interface PreviewViewController : UIViewController<UIWebViewDelegate,NSURLConnectionDelegate>
{
    IBOutlet UIWebView * _webView;
    IBOutlet NSString * _urlString;
    BOOL _authenticated;
    NSURLConnection *_urlConnection;
}

@property (nonatomic ,retain) UIWebView * webView;
@property (nonatomic ,retain) NSString * urlString;
+ (PreviewViewController *)initViewControllerUrl:(NSString *)url;

- (void)doneBarButtonClicked;
@end
