//
//  WalletTextfield.m
//  WalletToWallet
//
//  Created by harish on 03/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletTextfield.h"

@implementation WalletTextfield

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 2.0;
    self.backgroundColor = [UIColor whiteColor];
    
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 5, bounds.size.width - 20, bounds.size.height - 10);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 10, bounds.origin.y + 5, bounds.size.width - 20, bounds.size.height - 10);
}
@end
