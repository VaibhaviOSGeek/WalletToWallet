//
//  WalletToWalletAccount.m
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletToWalletAccount.h"
#define ENCODING_VERSION        2
@implementation WalletToWalletAccount
@synthesize userId=_userId;
@synthesize userName=_userName;
@synthesize password=_password;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self)
    {
        if ([aDecoder decodeIntForKey:@"version"] == ENCODING_VERSION)
        {
            _userName = [aDecoder decodeObjectForKey:@"username"] ;
            _password = [aDecoder decodeObjectForKey:@"password"];
             _userId = [[aDecoder decodeObjectForKey:@"userId"] intValue];
        }
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInt:ENCODING_VERSION forKey:@"version"];
    [aCoder encodeObject:_userName forKey:@"username"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:[NSNumber numberWithInt:_userId] forKey:@"userId"];
}

@dynamic authenticated;


- (NSString *)getPasswordHash {
    NSString *temp = [NSString stringWithFormat:@"%@%@",@"01depb10ilabs2009", _password];
    const char *cstr = [temp cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:temp.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (void) registrationAccountRegistrationInfo:(RegistrationInfo *)reg AccountDelegate:(id<UniversalDelegate>)delegate{
    
    _postDelegate =delegate;
    WalletToWalletRequest *request = [[WalletToWalletRequest alloc]initWithApiMethod:REGISTRATION andDelegate:self andMethod:POST];
    
    [request setParameter:reg.firstName forKey:@"firstname"];
    [request setParameter:reg.lastName forKey:@"lastname"];
    [request setParameter:reg.username forKey:@"username"];
    [request setParameter:reg.password forKey:@"password"];
    [request setParameter:reg.gender forKey:@"gender"];
    [request setParameter:reg.email forKey:@"email"];
    [request setParameter:reg.phoneNumber forKey:@"phone_number"];
    request.Tag =REGISTRATION;
    [request startRequest];
    
}
-(void)forgotPasswordAccount:(NSString *)EmailAddress AccountDelegate:(id<UniversalDelegate>)delegate{
    _postDelegate = delegate;
    
    WalletToWalletRequest *request = [[WalletToWalletRequest alloc]initWithApiMethod:PASSWORD_FORGOTTEN andDelegate:self andMethod:POST];
    [request setParameter:EmailAddress forKey:@"email_address"];
    request.Tag =PASSWORD_FORGOTTEN;
    [request startRequest];

}
- (void)authenticatedWithUserName:(NSString *)username andPassword:(NSString *)password withDelegate:(id<AccountAuthenticateDelegate>) del{
    _userName = username;
    _password = password;
    _delegate = del;
    
    WalletToWalletRequest *request = [[WalletToWalletRequest alloc]initWithApiMethod:LOGIN andDelegate:self andMethod:POST];
    [request setParameter:_userName forKey:@"email_address"];
    [request setParameter:_password forKey:@"password"];
    request.Tag =LOGIN;
    [request startRequest];
}

-(void)changePasswordAccount:(NSString *)EmailAddress Password:(NSString *)password AccountDelegate:(id<UniversalDelegate>)delegate
{
    _postDelegate = delegate;
    
    WalletToWalletRequest *request = [[WalletToWalletRequest alloc]initWithApiMethod:CHANGE_PASSWORD andDelegate:self andMethod:POST];
    [request setParameter:EmailAddress forKey:@"email_address"];
    [request setParameter:_password forKey:@"new_password"];
    [request setParameter:_password forKey:@"confirm_password"];

    request.Tag =CHANGE_PASSWORD;
    [request startRequest];
}

#pragma FieldworkRequestDelegate
-(void)WalletToWalletRequestDidSucceed:(WalletToWalletRequest *)request
{
    if (request.IsSuccess) {
        NSDictionary *dict = request.responseData;
        
        if ([request.Tag isEqual:LOGIN]) {
            NSDictionary *result = [dict objectForKey:@"parameters"];
            if (result) {
                if ([result objectForKey:@"user_id"]) {
                    _userId = [[result objectForKey:@"user_id"]intValue];
                }
                if ([result objectForKey:@"user_name"]) {
                    _userName = [result objectForKey:@"user_name"];
                }
                
                if (result) {
                    [_delegate accountAuthenticatedWithAccount:self];
                }
            }
        }else if ([request.Tag isEqual:REGISTRATION]){
            if ([dict objectForKey:@"description"]) {
                if (_postDelegate && [_postDelegate respondsToSelector:@selector(DataPostToServerSuccessfully:)]) {
                    [_postDelegate DataPostToServerSuccessfully:request];
                }
            }
        }else  if ([request.Tag isEqual:CHANGE_PASSWORD]) {
            if ([dict objectForKey:@"description"]) {
                if (_postDelegate && [_postDelegate respondsToSelector:@selector(DataPostToServerSuccessfully:)]) {
                    [_postDelegate DataPostToServerSuccessfully:request];
                }
            }

        }else if ([request.Tag isEqual:PASSWORD_FORGOTTEN]){
            
            if (_postDelegate && [_postDelegate respondsToSelector:@selector(DataPostToServerSuccessfully:)]) {
                [_postDelegate DataPostToServerSuccessfully:request];
            }

    }
    }
}
-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest *)request withError:(NSError *)error{
    [_delegate accountDidFailAuthentication:error];
}

-(void)WalletToWalletRequestDidFail:(WalletToWalletRequest *)request withStringError:(NSString *)error{
    [[ActivityIndicator currentIndicator] displayCompletedWithError:@"Fail"];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE
                                                     message:error
                                                    delegate:nil
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
    
    
    
    [alert show];

}
@end
