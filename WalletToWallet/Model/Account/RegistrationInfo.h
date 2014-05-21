//
//  RegistrationInfo.h
//  WalletToWallet
//
//  Created by harish on 08/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistrationInfo : NSObject{
    
    NSString * _firstName;
    NSString * _lastName;
    NSString * _username;
    NSString * _password;
    NSString * _gender;
    NSString * _email;
    NSString * _phoneNumber;
    
}

@property (nonatomic ,retain) NSString * firstName;
@property (nonatomic ,retain) NSString * lastName;
@property (nonatomic ,retain) NSString * username;
@property (nonatomic ,retain) NSString * password;
@property (nonatomic ,retain) NSString * gender;
@property (nonatomic ,retain) NSString * email;
@property (nonatomic ,retain) NSString * phoneNumber;


@end
