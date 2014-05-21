//
//  WalletToWalletAccount.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AccountAuthenticateDelegate.h"
#import "WalletToWalletRequest.h"
#import <CommonCrypto/CommonDigest.h>
#import "RegistrationInfo.h"
#import "UniversalDelegate.h"
#import "ActivityIndicator.h"
#import "security_questionInfo.h"
@interface WalletToWalletAccount : NSObject<NSCoding, WalletToWalletRequestDelegate>
{
    NSString * _userName;
    NSString * _password;
    id<AccountAuthenticateDelegate> _delegate;
    id<UniversalDelegate>_postDelegate;
    int _userId;
}
@property (nonatomic ,assign) int userId;
@property (nonatomic, readonly) NSString *userName;
@property (nonatomic, readonly) NSString *password;
@property (nonatomic, readonly) BOOL authenticated;
- (NSString*) getPasswordHash;

- (void) authenticatedWithUserName:(NSString*) username andPassword:(NSString*) password withDelegate:(id<AccountAuthenticateDelegate>) del;
- (void) registrationAccountRegistrationInfo:(RegistrationInfo *)reg AccountDelegate:(id<UniversalDelegate>)delegate;
- (void) changePasswordAccount:(NSString *)EmailAddress Password:(NSString *)password AccountDelegate:(id<UniversalDelegate>)delegate;

- (void) forgotPasswordAccount:(NSString *)EmailAddress AccountDelegate:(id<UniversalDelegate>)delegate;



@end
