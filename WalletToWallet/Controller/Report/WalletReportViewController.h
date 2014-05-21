//
//  WalletReportViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportTableCell.h"
@interface WalletReportViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView * _tblView;
    NSMutableArray * _reportArray;
}
@property (nonatomic ,retain) UITableView * tblView;
@property (nonatomic, retain) NSMutableArray * reportArray;
+(WalletReportViewController *)initViewController;
@end
