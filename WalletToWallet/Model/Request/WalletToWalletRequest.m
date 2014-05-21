//
//  WalletToWalletRequest.m
//  WalletToWallet
//
//  Created by harish on 02/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletToWalletRequest.h"
#define TIMEOUT_INTERVAL       20.0
@implementation WalletToWalletRequest
@synthesize delegate = _delegate;
@synthesize message = _message;
@synthesize methodType = _methodType;
@synthesize responseData = _responseData;
@synthesize IsSuccess = _isSuccess;
@synthesize StatusCode = _statusCode;
@synthesize Tag = _Tag;
@synthesize postData = _postData;

- (id)initWithApiMethod:(NSString *)method andDelegate:(id<WalletToWalletRequestDelegate>)del {
    return [self initWithApiMethod:method andDelegate:del andMethod:GET];
}

- (id)initWithApiMethod:(NSString *)method andDelegate:(id<WalletToWalletRequestDelegate>)del andMethod:(RequestMethod)requestMethod{
    self = [super init];
    
    if (self)
    {
        _urlString = [NSString stringWithFormat:@"%@%@",WalletToWallet_URL_BASE, method];
        
        
        _delegate = del;
        _methodType = requestMethod;
        _postParameters = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void)setParameter:(id)parameter forKey:(NSString *)key
{
    [_postParameters setObject:parameter forKey:key];
    
}
- (void)startRequest {
    [_request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    
    NSString *passingData = @"";
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    if (_postParameters && _postParameters.count > 0)
    {
        for (NSString *key in [_postParameters allKeys]) {
            NSString *temp = [NSString stringWithFormat:@"%@=%@", key, [_postParameters objectForKey:key]];
            [arr addObject:temp];
        }
        passingData = [arr joinWithDelimeter:@"&"];
    }
    if (_methodType == GET) {
        
        if (passingData.length > 0) {
            _urlString = [NSString stringWithFormat:@"%@&%@", _urlString, passingData];
        }
        
        
        NSURL *url = [NSURL URLWithString:_urlString];
        
        _request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
        [_request setHTTPMethod:@"GET"];
        [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
    } else if(_methodType == POST){
        NSURL *url = [NSURL URLWithString:_urlString];
        
        _request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:TIMEOUT_INTERVAL];
        [_request setHTTPMethod:@"POST"];
        [_request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        if (passingData.length > 0) {
            [_request setHTTPBody: [passingData dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    
    _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self startImmediately:TRUE];
}

-(void)requestSucceeded
{
    [_delegate WalletToWalletRequestDidSucceed:self];
    
}

-(void)requestFailed:(NSError*) error
{
    [_delegate WalletToWalletRequestDidFail:self withError:error];
    
}

-(void)requestFailedString:(NSString *)string
{
    [_delegate WalletToWalletRequestDidFail:self withStringError:string];
    
}



#pragma NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _data = [[NSMutableData alloc] init];
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    self.StatusCode = [httpResponse statusCode];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [self performSelectorOnMainThread:@selector(requestFailed:) withObject:error waitUntilDone:FALSE];
    
    _data = nil;
    
    _connection = nil;
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    SBJSON *jsonParser = [[SBJSON alloc] init];
    NSString *stringValue = [[NSString alloc] initWithData:_data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id serverData = nil;
    @try
    {
        serverData = [jsonParser objectWithString:stringValue error:&error];
        
        if (![serverData isKindOfClass:[NSDictionary class]] && ![serverData isKindOfClass:[NSArray class]])
        {
            error = [NSError errorWithDomain:@"JsonParseError" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Invalid server data format", @"message", nil]];
            serverData = nil;
            self.IsSuccess = NO;
        }
    }
    @catch (NSException *exception)
    {
        error = [NSError errorWithDomain:@"JsonParseError" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Error proccessing server data", @"message", nil]];
    }
    
    if (serverData) {
        _responseData = serverData;
        
        //[self ParsingWithLogin:serverData];
        
        
        if(_responseData != nil && self.StatusCode ==200){
            self.IsSuccess = YES;
        }
    }
    
    if (self.IsSuccess)
    {
        if ([[_responseData objectForKey:@"code"]intValue] == 50) {
            [self performSelectorOnMainThread:@selector(requestFailedString:) withObject:[_responseData objectForKey:@"description"] waitUntilDone:FALSE];
        }else{
         [self performSelectorOnMainThread:@selector(requestSucceeded) withObject:nil waitUntilDone:FALSE];
        }
    }else{
        error = [NSError errorWithDomain:@"RequestError" code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:@"Could not complete your request, please try again later.", @"message", nil]];
        [self performSelectorOnMainThread:@selector(requestFailed:) withObject:error waitUntilDone:FALSE];
    }
    
    _data = nil;
    
    //_connection = nil;
    
}
@end
