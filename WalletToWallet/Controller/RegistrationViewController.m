//
//  RegistrationViewController.m
//  WalletToWallet
//
//  Created by harish on 03/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()

@end

@implementation RegistrationViewController
@synthesize txtEmail=_txtEmail;
@synthesize txtFirstName=_txtFirstName;
@synthesize txtLastName=_txtLastName;
@synthesize txtPhone=_txtPhone;
@synthesize txtPassword=_txtPassword;
@synthesize txtUserName=_txtUserName;
@synthesize selectedGender=_selectedGender;
@synthesize confirmPassword=_confirmPassword;
@synthesize txtDateOfBirth=_txtDateOfBirth;

+(RegistrationViewController *)initViewController{
    RegistrationViewController * registrationViewController;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        registrationViewController =[[RegistrationViewController alloc]initWithNibName:@"RegistrationViewController_iPad" bundle:[NSBundle mainBundle]];}
    else
    {
        registrationViewController =[[RegistrationViewController alloc]initWithNibName:@"RegistrationViewController" bundle:[NSBundle mainBundle]];
    }
    
    registrationViewController.title =@"Registration";
    return registrationViewController;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    
    UIBarButtonItem * logOutBarButton =[[UIBarButtonItem alloc]initWithTitle:@"Login" style:UIBarButtonItemStylePlain target:self action:@selector(loginView:)];
    self.navigationItem.leftBarButtonItem = logOutBarButton;
    
}
-(void)loginView:(id)sender{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)genderSelectClicked:(id)sender{
    ToggleButton *t =sender;
    switch (t.tag)
    {
        case 1:
            _selectedGender =@"male";
            break;
        case 2:
            _selectedGender =@"female";
            break;
    }
    
}

-(void)submitClicked:(id)sender{
    if (_txtFirstName.text.length <=0 && _txtLastName.text.length <= 0 && _txtEmail.text.length <= 0 && _txtPhone.text.length <= 0) {
        
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter full fill information." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }else{
        
        RegistrationInfo * reg =[[RegistrationInfo alloc]init];
        reg.firstName = _txtFirstName.text;
        reg.lastName = _txtLastName.text;
        reg.username = _txtUserName.text;
        reg.password = _txtPassword.text;
        reg.gender = _selectedGender;
        reg.phoneNumber = _txtPhone.text;
        reg.email = _txtEmail.text;
        
        [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
        
        WalletToWalletAccount * wallet =[[WalletToWalletAccount alloc]init];
        [wallet registrationAccountRegistrationInfo:reg AccountDelegate:self];
        
    }
    
    
}

-(void)selectDOBClicked:(id)sender{
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        pickerContainerView = [[UIView alloc]initWithFrame:CGRectMake(0,300, 768,650)];
        pickerContainerView.backgroundColor = [UIColor lightGrayColor];
        CGRect pickerFrame = CGRectMake(0,100,768,400);
        _datePicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
        _datePicker.tag=100;
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.date = [NSDate date];
        
        [pickerContainerView addSubview:_datePicker];
        [self.view addSubview:pickerContainerView];
        
        UIView * pickerButtonContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 768, 100)];
        pickerButtonContainer.backgroundColor = [UIColor clearColor];
        
        UIButton *Done = [UIButton buttonWithType:UIButtonTypeCustom];
        Done.tag =0;
        [Done addTarget:self
                 action:@selector(startTimePickerdatePicker)
       forControlEvents:UIControlEventTouchUpInside];
        
        [Done setTitle:@" Done " forState:UIControlStateNormal];
        [Done setTitle:@" Done " forState:UIControlStateHighlighted];
        [Done setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        
        Done.frame = CGRectMake(296.0, 10.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:Done];
        
        UIButton *btnCencel = [UIButton buttonWithType:UIButtonTypeCustom];
        btnCencel.tag =1;
        [btnCencel addTarget:self
                      action:@selector(cancelTimePicker)
            forControlEvents:UIControlEventTouchUpInside];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateNormal];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateHighlighted];
        [btnCencel setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        //btnCencel.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:170.0f/255.0f blue:225.0f/255.0f alpha:1.0];
        btnCencel.frame = CGRectMake(296.0, 46.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:btnCencel];
        
        [pickerContainerView addSubview:pickerButtonContainer];
        
        [pickerContainerView setFrame:CGRectMake( 0.0f, 1500.0f, 768.0f, 600.0f)]; //notice this is OFF screen!
        [UIView beginAnimations:@"pickerContainerView" context:nil];
        //[UIView setAnimationDuration:0.];
        [UIView animateWithDuration:0.5 animations:^{
            pickerContainerView.frame=CGRectMake(0, 600, 768, 400);
        }];
        //[pickerContainerView setFrame:CGRectMake(0,600, 768, 400)]; //notice this is ON screen!
        [UIView commitAnimations];
        
    }else{
        _pickerContainer = [[UIActionSheet alloc] initWithTitle:@"Date of Birth" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Done",nil];
        
        CGRect pickerFrame = CGRectMake(0,180, 0,200);
        _pickerView = [[UIDatePicker alloc] initWithFrame:pickerFrame];
        _pickerView.datePickerMode = UIDatePickerModeDate;
        _pickerView.date = [NSDate date];
        [_pickerView addTarget:self
                        action:@selector(dateBirthChange:)
              forControlEvents:UIControlEventValueChanged];
        _pickerContainer.tag = 10;
        _pickerContainer.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        
        [_pickerContainer addSubview:_pickerView];
        [_pickerContainer showInView:self.view];
        [_pickerContainer setBounds:CGRectMake(0,0,320,550)];
    }
}

-(void)cancelTimePicker
{
    [UIView beginAnimations:@"pickerContainerView" context:nil];
    //[UIView setAnimationDuration:0.8];
    [UIView animateWithDuration:0.5 animations:^{
        pickerContainerView.frame=CGRectMake(0.0f, 1500.0f, 768.0f, 309.0f);
    }];
    
    //[pickerContainerView setFrame:CGRectMake( 0.0f, 1500.0f, 768.0f, 309.0f)]; //notice this is OFF screen!
    [UIView commitAnimations];
    
}

-(void)startTimePickerdatePicker
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    _txtDateOfBirth.text = [NSString stringWithFormat:@"%@",
                            [df stringFromDate:_datePicker.date]];
    [UIView beginAnimations:@"pickerContainerView" context:nil];
    [UIView animateWithDuration:0.5 animations:^{
        pickerContainerView.frame=CGRectMake(0.0f, 1500.0f, 768.0f, 309.0f);
    }];
    
    [UIView commitAnimations];
}

-(void)dateBirthChange:(id)sender{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateStyle = NSDateFormatterMediumStyle;
    _txtDateOfBirth.text = [NSString stringWithFormat:@"%@",
                            [df stringFromDate:_pickerView.date]];
}


#pragma mark -UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField.tag == 1000) {
        // Email
        
        if (_txtEmail.text.length>0) {
            if (![Utility validateEmailWithString:textField.text]) {
                UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter valid Email Address!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alertView show];
                _txtEmail.text=@"";
            }
            
        }
    }else{
        if (_txtPassword.text.length > 0 && _confirmPassword.text.length > 0) {
            if (![_txtPassword.text isEqual:_confirmPassword.text]) {
                UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Password does not match!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alertView show];
                _txtPassword.text=@"";
                _confirmPassword.text=@"";
            }
        }
    }
}
#pragma mark -UniversalDelegate
-(void)DataPostToServerSuccessfully:(WalletToWalletRequest *)responce{
    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:[responce.responseData objectForKey:@"description"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

#pragma mark -UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
}

-(void)DataPostToServerFailWithError:(NSString *)error{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
