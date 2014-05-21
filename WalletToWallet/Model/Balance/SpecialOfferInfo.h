//
//  SpecialOfferInfo.h
//  WalletToWallet
//
//  Created by harish on 18/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialOfferInfo : NSObject
{
    NSString * _logo;
    NSString * _company_name;
    NSString * _contact_name;
    NSString * _offer_value;
    NSString * _package_value;
    NSString * _discount_format;
    NSString * _short_description;
    NSString * _long_description;
    BOOL _offer_status;

}
@property (nonatomic ,retain) NSString * logo;
@property (nonatomic ,retain) NSString * company_name;
@property (nonatomic ,retain) NSString * contact_name;
@property (nonatomic ,retain) NSString * offer_value;
@property (nonatomic ,retain) NSString * package_value;
@property (nonatomic ,retain) NSString * discount_format;
@property (nonatomic ,retain) NSString * short_description;
@property (nonatomic ,retain) NSString * long_description;
@property (nonatomic ,assign) BOOL offer_status;

+ (SpecialOfferInfo *)parseWithDictionary:(NSDictionary *)dict;
@end
