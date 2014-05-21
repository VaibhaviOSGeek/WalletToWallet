//
//  WalletTrasferChargeInfo.h
//  WalletToWallet
//
//  Created by harish on 06/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WalletTrasferChargeInfo : NSObject
{
    NSString * _title;
    NSString * _value;
}
@property (nonatomic ,retain) NSString * title;
@property (nonatomic ,retain) NSString * value;

+ (WalletTrasferChargeInfo *)parseWithDictionary:(NSDictionary *)dict;
@end
