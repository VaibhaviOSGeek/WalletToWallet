//
//  RegistrationViewController.h
//  WalletToWallet
//
//  Created by harish on 03/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "RegistrationInfo.h"
#import "ToggleButton.h"
#import "Utility.h"
#import "RadioButtonGroup.h"
#import "UniversalDelegate.h"
#import "WalletToWalletAccount.h"

@interface RegistrationViewController : UIViewController<UITextFieldDelegate,UniversalDelegate,UIActionSheetDelegate>
{
    IBOutlet UITextField * _txtFirstName;
    IBOutlet UITextField * _txtLastName;
    IBOutlet UITextField * _txtEmail;
    IBOutlet UITextField * _txtPhone;
    IBOutlet UITextField * _txtPassword;
    IBOutlet UITextField * _confirmPassword;
    IBOutlet UITextField * _txtUserName;
    IBOutlet UITextField * _txtDateOfBirth;
    NSString * _selectedGender;
    UIActionSheet *_pickerContainer;
    UIDatePicker *_pickerView;
    UIView * pickerContainerView;
    UIDatePicker * _datePicker;

}
@property (nonatomic ,retain) UITextField * txtDateOfBirth;
@property (nonatomic ,retain) NSString * selectedGender;
@property (nonatomic ,retain) UITextField * txtFirstName;
@property (nonatomic ,retain) UITextField * txtLastName;
@property (nonatomic ,retain) UITextField * txtEmail;
@property (nonatomic ,retain) UITextField * txtPhone;
@property (nonatomic ,retain) UITextField * txtPassword;
@property (nonatomic ,retain) UITextField * txtUserName;
@property (nonatomic ,retain) UITextField * confirmPassword;

+ (RegistrationViewController *)initViewController;

- (IBAction)submitClicked:(id)sender;
- (IBAction)loginView:(id)sender;
- (IBAction)genderSelectClicked:(id)sender;
- (IBAction)selectDOBClicked:(id)sender;
- (IBAction)dateBirthChange:(id)sender;

@end
