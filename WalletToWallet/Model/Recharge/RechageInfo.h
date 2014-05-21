//
//  RechageInfo.h
//  WalletToWallet
//
//  Created by harish on 18/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RechageInfo : NSObject{
    NSString * _title;
    NSString * _value;
}
@property (nonatomic ,retain) NSString * title;
@property (nonatomic ,retain) NSString * value;

+ (RechageInfo *)parseWithDictionary:(NSDictionary *)dict;

@end
