//
//  security_questionInfo.h
//  WalletToWallet
//
//  Created by harish on 21/05/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface security_questionInfo : NSObject{
    NSString * _security_question_one;
    NSString * _security_question_one_answer;
    NSString * _security_question_two;
    NSString * _security_question_two_answer;
}
@property (nonatomic ,retain) NSString * security_question_one;
@property (nonatomic ,retain) NSString * security_question_one_answer;
@property (nonatomic ,retain) NSString * security_question_two;
@property (nonatomic ,retain) NSString * security_question_two_answer;

@end
