//
//  AccountManager.m
//  AccountManager
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//


#import "AccountManager.h"

NSString *kActiveUserKey = @"EncodedActiveUser";

@implementation AccountManager


+(AccountManager*)Instance
{
    static AccountManager* singleton = nil;
    
    if (singleton == nil)
        singleton = [[AccountManager alloc] init];
    
    return singleton;

}

-(NSString*)accountFilename
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) lastObject];
    return [documentsPath stringByAppendingPathComponent:@"AccountInformation.dat"];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        NSData *accountData = [[NSUserDefaults standardUserDefaults] objectForKey:kActiveUserKey];
        
        if (accountData)
        {
            _activeAccount = [NSKeyedUnarchiver unarchiveObjectWithData:accountData];
        }
        
        _savedAccounts = [NSKeyedUnarchiver unarchiveObjectWithFile:[self accountFilename]];
        
        if (_savedAccounts == nil)
            _savedAccounts = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)saveAccounts
{
    [NSKeyedArchiver archiveRootObject:_savedAccounts toFile:[self accountFilename]];
}

-(void)saveAccount
{
    NSData *data = nil;
    
    if (_activeAccount)
        data = [NSKeyedArchiver archivedDataWithRootObject:_activeAccount];
    
    if (data)
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kActiveUserKey];
    else
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kActiveUserKey];
    
    if (_activeAccount)
    {
        [_savedAccounts setObject:_activeAccount forKey:_activeAccount.userName];
        [self saveAccounts];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark Properties

@synthesize activeAccount = _activeAccount;

-(void)setActiveAccount:(WalletToWalletAccount *)activeAccount
{
    _activeAccount = activeAccount;
    
    [self saveAccount];
}




@end
