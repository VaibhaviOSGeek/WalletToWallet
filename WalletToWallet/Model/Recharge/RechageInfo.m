//
//  RechageInfo.m
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RechageInfo.h"

@implementation RechageInfo
@synthesize title=_title;
@synthesize value=_value;

+ (RechageInfo *)parseWithDictionary:(NSDictionary *)dict{
    RechageInfo * recharge =[[RechageInfo alloc]init];
    
    if ([dict objectForKey:@"title"]) {
        recharge.title = [dict objectForKey:@"title"];
    }
    if ([dict objectForKey:@"value"]) {
        recharge.value = [dict objectForKey:@"value"];
    }
    return recharge;
}
@end
