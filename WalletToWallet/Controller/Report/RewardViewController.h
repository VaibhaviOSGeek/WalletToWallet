//
//  RewardViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportList.h"
#import "Constant.h"
#import "ActivityIndicator.h"
#import "ModelListDelegate.h"
#import "ReportTableCell.h"
@interface RewardViewController : UIViewController<ModelListDelegate,UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * _reportArray;
    IBOutlet UITableView * _tblReport;
}
@property (nonatomic ,retain) UITableView * tblReport;
@property (nonatomic ,retain) NSMutableArray * reportArray;
+(RewardViewController *)initViewController;
@end
