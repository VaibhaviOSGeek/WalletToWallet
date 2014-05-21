//
//  ReportTableCell.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "ReportTableCell.h"

@implementation ReportTableCell
@synthesize lblamount=_lblamount;
@synthesize lblDate=_lblDate;
@synthesize lblDec=_lblDec;
@synthesize lblPoint=_lblPoint;
@synthesize lblTrasectionId=_lblTrasectionId;
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

    _lblamount.text = reward.amount;
    _lblDate.text = reward.dateStringFormat;
    _lblDec.text = reward.description;
    _lblPoint.text = reward.points;
    _lblTrasectionId.text = reward.transaction_id;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
