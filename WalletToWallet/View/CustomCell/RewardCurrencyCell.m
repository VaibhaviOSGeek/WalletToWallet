//
//  RewardCurrencyCell.m
//  WalletToWallet
//
//  Created by harish on 30/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RewardCurrencyCell.h"

@implementation RewardCurrencyCell
@synthesize lblamount=_lblamount;
@synthesize lblDate=_lblDate;
@synthesize lblDec=_lblDec;
@synthesize lblPoint=_lblPoint;
@synthesize containerView=_containerView;
@synthesize view=_view;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setData:(RewordReportInfo *)reward{
    /*
     date: "22-Feb-2014"
     description: "Redeem Points"
     points: null
     amount: "&#8358;0.00"
     */
    _lblamount.text = reward.amount;
    _lblDate.text = reward.dateStringFormat;
    _lblDec.text = reward.description;
    _lblPoint.text = reward.points;
   
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
