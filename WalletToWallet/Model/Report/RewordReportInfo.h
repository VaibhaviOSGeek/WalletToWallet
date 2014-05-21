//
//  RewordReportInfo.h
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RewordReportInfo : NSObject
{
    NSString * _dateStringFormat;
    NSString * _description;
    NSString * _transaction_id;
    NSString * _points;
    NSString * _amount;
}
@property (nonatomic ,retain)NSString * dateStringFormat;
@property (nonatomic ,retain)NSString * description;
@property (nonatomic ,retain)NSString * transaction_id;
@property (nonatomic ,retain)NSString * points;
@property (nonatomic ,retain)NSString * amount;

+ (RewordReportInfo *)parseWithDictionary:(NSDictionary *)dict;
@end
