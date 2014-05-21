//
//  WalletTrasferChargeInfo.m
//  WalletToWallet
//
//  Created by harish on 06/04/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletTrasferChargeInfo.h"

@implementation WalletTrasferChargeInfo
@synthesize title=_title;
@synthesize value=_value;

+(WalletTrasferChargeInfo *)parseWithDictionary:(NSDictionary *)dict{
    WalletTrasferChargeInfo * wallet =[[WalletTrasferChargeInfo alloc]init];
    if ([dict objectForKey:@"title"]) {
        wallet.title = [dict objectForKey:@"title"];
    }
    if ([dict objectForKey:@"value"]) {
        wallet.value = [dict objectForKey:@"value"];
    }
    return wallet;
}

@end
