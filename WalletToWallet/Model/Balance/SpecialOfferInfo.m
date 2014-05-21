//
//  SpecialOfferInfo.m
//  WalletToWallet
//
//  Created by harish on 18/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "SpecialOfferInfo.h"

@implementation SpecialOfferInfo
@synthesize logo=_logo;
@synthesize company_name=_company_name;
@synthesize contact_name=_contact_name;
@synthesize offer_status=_offer_status;
@synthesize package_value=_package_value;
@synthesize discount_format=_discount_format;
@synthesize short_description=_short_description;
@synthesize long_description=_long_description;
@synthesize offer_value=_offer_value;


+(SpecialOfferInfo *)parseWithDictionary:(NSDictionary *)dict{
    SpecialOfferInfo * special =[[SpecialOfferInfo alloc]init];
    
   if ([dict objectForKey:@"logo"]) {
       special.logo = [dict objectForKey:@"logo"];
    }
    if ([dict objectForKey:@"company_name"]) {
        special.company_name = [dict objectForKey:@"company_name"];
    }
    if ([dict objectForKey:@"contact_name"]) {
        special.contact_name = [dict objectForKey:@"contact_name"];
    }
    if ([dict objectForKey:@"offer_value"]) {
        special.offer_value = [dict objectForKey:@"offer_value"];
    }
    if ([dict objectForKey:@"package_value"]) {
        special.package_value = [dict objectForKey:@"package_value"];
    }
    if ([dict objectForKey:@"discount_format"]) {
        special.discount_format= [dict objectForKey:@"discount_format"];
    }
    if ([dict objectForKey:@"short_description"]) {
        special.short_description = [dict objectForKey:@"short_description"];
    }
    if ([dict objectForKey:@"long_description"]) {
        special.long_description = [dict objectForKey:@"long_description"];
    }
    if ([dict objectForKey:@"offer_status"]) {
        special.offer_status = [[dict objectForKey:@"offer_status"] boolValue];
    }
    return special;
}
@end
