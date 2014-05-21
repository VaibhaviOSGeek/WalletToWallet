//
//  Utility.h
//  WalletToWallet
//
//  Created by harish on 05/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (BOOL)validateEmailWithString:(NSString*)email;

+ (NSString *)getCurrencyFormatFromFloat:(float)floatValue;

@end
