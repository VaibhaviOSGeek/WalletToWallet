//
//  WalletToWalletViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "WalletToWalletViewController.h"

@interface WalletToWalletViewController ()

@end

@implementation WalletToWalletViewController
@synthesize txtActualAmount=_txtActualAmount;
@synthesize txtCurrency=_txtCurrency;
@synthesize txtMethod=_txtMethod;
@synthesize txtFromAccount=_txtFromAccount;
@synthesize txtFromAccountName=_txtFromAccountName;
@synthesize txtToAccount=_txtToAccount;
@synthesize txtToAccountName=_txtToAccountName;
@synthesize scrollView=_scrollView;

+(WalletToWalletViewController *)initViewController{
   //WalletToWalletViewController_iPad
    WalletToWalletViewController * recharge;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        recharge =[[WalletToWalletViewController alloc]initWithNibName:@"WalletToWalletViewController_iPad" bundle:[NSBundle mainBundle]];

    }
    else
    {
        recharge =[[WalletToWalletViewController alloc]initWithNibName:@"WalletToWalletViewController" bundle:[NSBundle mainBundle]];

    }
        recharge.title =@"Wallet To Wallet";
    return recharge;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    methodArray = [[NSMutableArray alloc]initWithObjects:@"Pay Using Card", nil];
    currencyArray = [[NSMutableArray alloc]initWithObjects:@"NGN", nil];
    CGSize size =  CGSizeMake(320, 800.0);
    [self.scrollView setContentSize:size];

    // Do any additional setup after loading the view from its nib.
}
-(void)methodClicked:(id)sender{
    
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        pickerContainerView = [[UIView alloc]initWithFrame:CGRectMake(0,300, 768,650)];
        pickerContainerView.backgroundColor = [UIColor lightGrayColor];
        
        pickerContainerView.layer.cornerRadius = 4;
        CGRect pickerFrame = CGRectMake(0,100,768,400);
        _pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
        _pickerView.tag = 1000;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        
        [pickerContainerView addSubview:_pickerView];
        [self.view addSubview:pickerContainerView];
        
        
        UIView * pickerButtonContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 768, 100)];
        pickerButtonContainer.backgroundColor = [UIColor clearColor];
        
        UIButton *Done = [UIButton buttonWithType:UIButtonTypeCustom];
        Done.tag =0;
        [Done addTarget:self
                 action:@selector(doneBtnClickedForPicker)
       forControlEvents:UIControlEventTouchUpInside];
        
        [Done setTitle:@" Done " forState:UIControlStateNormal];
        [Done setTitle:@" Done " forState:UIControlStateHighlighted];
        [Done setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        
        Done.frame = CGRectMake(296.0, 10.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:Done];
        
        UIButton *btnCencel = [UIButton buttonWithType:UIButtonTypeCustom];
        btnCencel.tag =1;
        [btnCencel addTarget:self
                      action:@selector(CancelBtnClickedForPicker)
            forControlEvents:UIControlEventTouchUpInside];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateNormal];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateHighlighted];
        [btnCencel setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        //btnCencel.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:170.0f/255.0f blue:225.0f/255.0f alpha:1.0];
        btnCencel.frame = CGRectMake(296.0, 46.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:btnCencel];
        
        [pickerContainerView addSubview:pickerButtonContainer];
        
        [pickerContainerView setFrame:CGRectMake( 10.0f, 1500.0f, 748.0f, 400)]; //notice this is OFF screen!
        [UIView beginAnimations:@"pickerContainerView" context:nil];
        //[UIView setAnimationDuration:0.];
        [UIView animateWithDuration:0.5 animations:^{
            pickerContainerView.frame=CGRectMake(10.0f, 600, 748, 400);
        }];
        //[pickerContainerView setFrame:CGRectMake(0,600, 768, 400)]; //notice this is ON screen!
        [UIView commitAnimations];
    }else{
    
    _pickerContainer = [[UIActionSheet alloc] initWithTitle:@"Method" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Done",nil];
    
    CGRect pickerFrame = CGRectMake(0,180, 0,200);
    _pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
    _pickerContainer.tag = 1000;
    _pickerView.tag = 1000;
    _pickerView.delegate =self;
    _pickerView.dataSource=self;
    _pickerContainer.delegate= self;
    _pickerContainer.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [_pickerContainer addSubview:_pickerView];
    [_pickerContainer showInView:self.view];
    [_pickerContainer setBounds:CGRectMake(0,0,320,550)];
}
}
-(void)doneBtnClickedForPicker
{
    if (_actionTag == 1000) {
        // Method
        _txtMethod.text = [methodArray objectAtIndex:0];
    }else{
        _txtCurrency.text = [currencyArray objectAtIndex:0];
    }
    
    
    [UIView beginAnimations:@"pickerContainerView" context:nil];
    
    [UIView animateWithDuration:0.5 animations:^{
        pickerContainerView.frame=CGRectMake(0.0f, 1500.0f, 768.0f, 309.0f);
    }];
    
    //[pickerContainerView setFrame:CGRectMake( 0.0f, 1500.0f, 768.0f, 309.0f)]; //notice this is OFF screen!
    [UIView commitAnimations];
}
-(void)CancelBtnClickedForPicker
{
    [UIView beginAnimations:@"pickerContainerView" context:nil];
    //[UIView setAnimationDuration:0.8];
    [UIView animateWithDuration:0.5 animations:^{
        pickerContainerView.frame=CGRectMake(0.0f, 1500.0f, 768.0f, 309.0f);
    }];
    
    [UIView commitAnimations];
}

-(void)curencyClicked:(id)sender{
    
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        pickerContainerView = [[UIView alloc]initWithFrame:CGRectMake(0,300, 768,650)];
        pickerContainerView.backgroundColor = [UIColor lightGrayColor];
        
        pickerContainerView.layer.cornerRadius = 4;
        CGRect pickerFrame = CGRectMake(0,100,768,400);
        _pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
         _pickerView.tag = 1001;
        _pickerView.dataSource = self;
        _pickerView.delegate = self;
        
        [pickerContainerView addSubview:_pickerView];
        [self.view addSubview:pickerContainerView];
        
        
        UIView * pickerButtonContainer = [[UIView alloc]initWithFrame:CGRectMake(0, 10, 768, 100)];
        pickerButtonContainer.backgroundColor = [UIColor clearColor];
        
        UIButton *Done = [UIButton buttonWithType:UIButtonTypeCustom];
        Done.tag =0;
        [Done addTarget:self
                 action:@selector(doneBtnClickedForPicker)
       forControlEvents:UIControlEventTouchUpInside];
        
        [Done setTitle:@" Done " forState:UIControlStateNormal];
        [Done setTitle:@" Done " forState:UIControlStateHighlighted];
        [Done setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        
        Done.frame = CGRectMake(296.0, 10.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:Done];
        
        UIButton *btnCencel = [UIButton buttonWithType:UIButtonTypeCustom];
        btnCencel.tag =1;
        [btnCencel addTarget:self
                      action:@selector(CancelBtnClickedForPicker)
            forControlEvents:UIControlEventTouchUpInside];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateNormal];
        [btnCencel setTitle:@" Cancel" forState:UIControlStateHighlighted];
        [btnCencel setBackgroundImage:[UIImage imageNamed:@"submit_122_30.png"] forState:UIControlStateNormal];
        //btnCencel.backgroundColor = [UIColor colorWithRed:0.0f/255.0f green:170.0f/255.0f blue:225.0f/255.0f alpha:1.0];
        btnCencel.frame = CGRectMake(296.0, 46.0, 177.0, 30.0);
        [pickerButtonContainer addSubview:btnCencel];
        
        [pickerContainerView addSubview:pickerButtonContainer];
        
        [pickerContainerView setFrame:CGRectMake( 10.0f, 1500.0f, 748.0f, 400)]; //notice this is OFF screen!
        [UIView beginAnimations:@"pickerContainerView" context:nil];
        //[UIView setAnimationDuration:0.];
        [UIView animateWithDuration:0.5 animations:^{
            pickerContainerView.frame=CGRectMake(10.0f, 600, 748, 400);
        }];
        //[pickerContainerView setFrame:CGRectMake(0,600, 768, 400)]; //notice this is ON screen!
        [UIView commitAnimations];
    }else{
        _pickerContainer = [[UIActionSheet alloc] initWithTitle:@"Currency" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Done",nil];
        
        CGRect pickerFrame = CGRectMake(0,180, 0,200);
        _pickerView = [[UIPickerView alloc] initWithFrame:pickerFrame];
        _pickerContainer.tag = 1001;
        _pickerView.tag = 1001;
        _pickerView.delegate =self;
        _pickerView.dataSource=self;
        _pickerContainer.delegate= self;
        _pickerView.showsSelectionIndicator = YES;
        _pickerContainer.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        [_pickerContainer addSubview:_pickerView];
        [_pickerContainer showInView:self.view];
        [_pickerContainer setBounds:CGRectMake(0,0,320,550)];
    }

    }




-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (pickerView.tag == 1000) {
        // Mrthod
        return [methodArray count];
    }else{
        //Currency
        return [currencyArray count];
    }
    return 0;
    
}

// Display each row's data
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str;
    _actionTag =pickerView.tag;
    if (pickerView.tag == 1000) {
        // Mrthod
        
        str = [methodArray objectAtIndex: row];
    }else{
        //Currency
        str = [currencyArray objectAtIndex: row];
    }
    return str;
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    PickerActiveIdx = row;
    if (pickerView.tag == 1000) {
        // Method
        _txtMethod.text = [methodArray objectAtIndex:PickerActiveIdx];
    }else{
        _txtCurrency.text = [currencyArray objectAtIndex:PickerActiveIdx];
    }

    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        if (actionSheet.tag == 1000) {
            // Method
            _txtMethod.text = [methodArray objectAtIndex:PickerActiveIdx];
        }else{
            _txtCurrency.text = [currencyArray objectAtIndex:PickerActiveIdx];
        }
        
        //done
    }
}
-(void)submitClicked:(id)sender{
//uid=17&account_no=WE-17-3692&account_name=Jack+Martin&currency=NGN&actual_amount=20&to_account_no=WE-17-3611&total_amount=38&account_pin=6436
    if (_txtActualAmount.text.length > 0) {
        [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Account Pin" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil] ;
        alertView.tag = 2;
        alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;
        [alertView show];
    }else{
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter Recharge amount.!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
    }

    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    UITextField * alertTextField = [alertView textFieldAtIndex:0];
    _pinNumber = alertTextField.text;
    
    [[RechageList instance]transfer_fund_confirmAccount_no:_txtToAccount.text AccountName:_txtToAccountName.text Currency:_txtCurrency.text ActualAmount:_txtActualAmount.text to_account_no:_txtFromAccount.text TotalAmount:[MyBalanceList instance].user_balance account_pin:alertTextField.text ModelDelegate:self];
     
    
    NSLog(@"alerttextfiled - %@",alertTextField.text);
    
    // do whatever you want to do with this UITextField.
}
-(void)clearAllData{
   
    _txtActualAmount.text =@"";
    _txtFromAccount.text =@"";
    _txtFromAccountName.text =@"";
    _txtToAccountName.text =@"";
    _txtCurrency.text =@"";
    _txtActualAmount.text =@"";
    _txtCurrency.text =@"";
    _txtMethod.text =@"";
}
#pragma mark -ModelListDelegate
-(void)ModelListLoadedSuccessfully{
    [[ActivityIndicator currentIndicator]displayCompleted];
    [self clearAllData];

    [self.navigationController popToRootViewControllerAnimated:NO];
}
-(void)ModelListLoadFailWithError:(NSString *)error{
    [[ActivityIndicator currentIndicator]displayCompleted];
    [self clearAllData];
    UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:error delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
