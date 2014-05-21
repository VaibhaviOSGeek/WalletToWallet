//
//  ModelListDelegate.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelListDelegate <NSObject>

-(void)ModelListLoadedSuccessfully;
-(void)ModelListLoadFailWithError:(NSString *)error;

@end
