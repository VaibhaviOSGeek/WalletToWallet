//
//  RewardCurrencyCell.h
//  WalletToWallet
//
//  Created by harish on 30/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RewordReportInfo.h"
@interface RewardCurrencyCell : UITableViewCell
{
    IBOutlet UILabel * _lblDate;
    IBOutlet UILabel * _lblDec;
    IBOutlet UILabel * _lblPoint;
    IBOutlet UIView * _containerView;
    IBOutlet UIView * _view;
    IBOutlet UILabel * _lblamount;
    
}
@property (nonatomic ,retain) UILabel * lblDate;
@property (nonatomic ,retain) UILabel * lblDec;
@property (nonatomic ,retain) UILabel * lblamount;
@property (nonatomic ,retain) UILabel * lblPoint;
@property (nonatomic ,retain) UIView * containerView;
@property (nonatomic ,retain) UIView * view;

- (void)setData:(RewordReportInfo *)reward;

@end
