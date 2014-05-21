//
//  RechageWalletViewController.h
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToggleButton.h"
#import "RadioButtonGroup.h"
#import "ModelListDelegate.h"
#import "ActivityIndicator.h"
#import "RechageList.h"
#import "PreviewViewController.h"
@interface RechageWalletViewController : UIViewController<UIActionSheetDelegate,UIPickerViewDataSource,UIPickerViewDelegate,ModelListDelegate>
{
    IBOutlet UITextField * _txtAccount;
    IBOutlet UITextField * _txtAccountName;
    IBOutlet UITextField * _txtActualAmount;
    IBOutlet UITextField * _txtMethod;
    IBOutlet UITextField * _txtCurrency;
    NSString * _selectedGender;
    UIActionSheet *_pickerContainer;
    UIPickerView *_pickerView;
    NSMutableArray * methodArray;
    NSMutableArray * currencyArray;
    NSInteger * PickerActiveIdx;
}
@property (nonatomic ,retain) UITextField * txtAccount;
@property (nonatomic ,retain) UITextField * txtAccountName;
@property (nonatomic ,retain) UITextField * txtActualAmount;
@property (nonatomic ,retain) UITextField * txtMethod;
@property (nonatomic ,retain) UITextField * txtCurrency;

+ (RechageWalletViewController *)iniViewController;

- (IBAction)submitClicked:(id)sender;
- (IBAction)methodClicked:(id)sender;
- (IBAction)curencyClicked:(id)sender;

- (void)clearAllData;
@end
