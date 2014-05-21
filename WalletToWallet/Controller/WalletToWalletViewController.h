//
//  WalletToWalletViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RechageList.h"
#import "RechageInfo.h"
#import "ActivityIndicator.h"

@interface WalletToWalletViewController : UIViewController<ModelListDelegate,UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    IBOutlet UITextField * _txtFromAccount;
    IBOutlet UITextField * _txtFromAccountName;
    IBOutlet UITextField * _txtActualAmount;
    IBOutlet UITextField * _txtMethod;
    IBOutlet UITextField * _txtCurrency;
    IBOutlet UITextField * _txtToAccount;
    IBOutlet UITextField * _txtToAccountName;
    IBOutlet NSString * _pinNumber;
    UIActionSheet *_pickerContainer;
    UIPickerView *_pickerView;
    NSMutableArray * methodArray;
    NSMutableArray * currencyArray;
    NSInteger * PickerActiveIdx;
    IBOutlet UIScrollView * _scrollView;
   
    UIView * pickerContainerView;
    int _actionTag;

    
}
@property (nonatomic ,assign) int actionTag;
@property (nonatomic ,retain) UIScrollView * scrollView;
@property (nonatomic ,retain) UITextField * txtFromAccount;
@property (nonatomic ,retain) UITextField * txtFromAccountName;
@property (nonatomic ,retain) UITextField * txtActualAmount;
@property (nonatomic ,retain) UITextField * txtMethod;
@property (nonatomic ,retain) UITextField * txtCurrency;
@property (nonatomic ,retain) UITextField * txtToAccount;
@property (nonatomic ,retain) UITextField * txtToAccountName;
@property (nonatomic ,retain) NSString * pinNumber;

+(WalletToWalletViewController *)initViewController;

- (IBAction)submitClicked:(id)sender;
- (IBAction)methodClicked:(id)sender;
- (IBAction)curencyClicked:(id)sender;
@end
