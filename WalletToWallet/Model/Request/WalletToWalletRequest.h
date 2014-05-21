//
//  WalletToWalletRequest.h
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"
#import "WalletToWalletRequestDelegate.h"
#import "WalletToWalletURLSchema.h"
#import "NSMutableArray+Join.h"
typedef enum {
    GET = 1,
    POST = 2,
    PUT = 3,
    DELETE = 4,
}RequestMethod;
@interface WalletToWalletRequest : NSObject<NSURLConnectionDelegate>
{
    id<WalletToWalletRequestDelegate> _delegate;
    
    NSURLConnection *_connection;
    NSMutableURLRequest *_request;
    NSMutableDictionary *_postParameters;
    
    NSMutableData *_data;
    
    id _responseData;
    
    RequestMethod _methodType;
    
    BOOL _IsSuccess;
    
    NSString *_message;
    
    NSString *_Tag;
    
    int _StatusCode;
    
    NSString *_postData;
    
    NSString *_requestUrl;
    
    BOOL status;
    
    NSString *_urlString;
}

@property (nonatomic, readwrite, retain) NSString *urlString;

@property (nonatomic, readwrite, retain) id<WalletToWalletRequestDelegate> delegate;

@property (nonatomic, readwrite, retain) NSString *message;

@property (nonatomic, readonly) RequestMethod methodType;

@property (nonatomic, assign) BOOL IsSuccess;

@property (nonatomic, readonly) id responseData;

@property (nonatomic, readwrite, retain) NSString *Tag;

@property (nonatomic, assign) int StatusCode;

@property (nonatomic, retain, readwrite) NSString *postData;


- (id) initWithApiMethod:(NSString*) method andDelegate:(id<WalletToWalletRequestDelegate>) del;



- (id) initWithApiMethod:(NSString*) method andDelegate:(id<WalletToWalletRequestDelegate>) del andMethod:(RequestMethod) requestMethod;

- (void)setParameter:(id)parameter forKey:(NSString *)key;

- (void) startRequest;

@end
