//
//  RewordReportInfo.m
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RewordReportInfo.h"

@implementation RewordReportInfo

@synthesize dateStringFormat=_dateStringFormat;
@synthesize description=_description;
@synthesize transaction_id=_transaction_id;
@synthesize points=_points;
@synthesize amount=_amount;

+(RewordReportInfo *)parseWithDictionary:(NSDictionary *)dict{
    RewordReportInfo * reward =[[RewordReportInfo alloc]init];
    if ([dict objectForKey:@"date"]) {
        reward.dateStringFormat = [dict objectForKey:@"date"];
    }
    if ([dict objectForKey:@"description"]) {
        reward.description = [dict objectForKey:@"description"];
    }
    if ([dict objectForKey:@"transaction_id"]) {
        reward.transaction_id = [dict objectForKey:@"transaction_id"];
    }
    if ([dict objectForKey:@"points"] == [NSNull null]) {
        reward.points = @"";
    }else{
        reward.points = [dict objectForKey:@"points"];
    }
    if ([dict objectForKey:@"amount"]) {
        reward.amount = [dict objectForKey:@"amount"];
    }
    return reward;
    


}
@end
