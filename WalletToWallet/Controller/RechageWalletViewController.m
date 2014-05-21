//
//  RechageWalletViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RechageWalletViewController.h"

@interface RechageWalletViewController ()

@end

@implementation RechageWalletViewController
@synthesize txtAccount=_txtAccount;
@synthesize txtAccountName=_txtAccountName;
@synthesize txtActualAmount=_txtActualAmount;
@synthesize txtCurrency=_txtCurrency;
@synthesize txtMethod=_txtMethod;

+(RechageWalletViewController *)iniViewController{
    RechageWalletViewController * recharge;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
         recharge =[[RechageWalletViewController alloc]initWithNibName:@"RechageWalletViewController_iPad" bundle:[NSBundle mainBundle]];
    }
    else
    {
         recharge =[[RechageWalletViewController alloc]initWithNibName:@"RechageWalletViewController" bundle:[NSBundle mainBundle]];
    }
  
    recharge.title =@"Rechage Wallet";
    return recharge;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _txtAccountName.text =@"Jack Martin";
    _txtAccount.text =@"WE-17-3692";
    methodArray = [[NSMutableArray alloc]initWithObjects:@"Pay Using Card", nil];
    currencyArray = [[NSMutableArray alloc]initWithObjects:@"NGN", nil];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)methodClicked:(id)sender{
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

-(void)curencyClicked:(id)sender{
    
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
    [_pickerContainer setBounds:CGRectMake(0,0,320,550)];}



-(void)submitClicked:(id)sender{

    if (_txtActualAmount.text.length > 0) {
         [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
        
        [[RechageList instance]wallet_recharge_confirmAccount_no:_txtAccount.text AccountName:_txtAccountName.text Currency:_txtCurrency.text ActualAmount:_txtActualAmount.text Payment_method:_txtMethod.text TotalAmount:_txtActualAmount.text ModelDelegate:self];
        
    }else{
        UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:@"Please enter Recharge amount.!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
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
-(void)clearAllData{

    _txtAccount.text =@"";
    _txtAccountName.text =@"";
    _txtActualAmount.text =@"";
    _txtCurrency.text =@"";
    _txtMethod.text =@"";
}
#pragma mark -ModelListDelegate
-(void)ModelListLoadedSuccessfully{
    [[ActivityIndicator currentIndicator]displayCompleted];
    [self clearAllData];
    
    
    
    PreviewViewController * preview = [PreviewViewController initViewControllerUrl:[RechageList instance].redirectUrl];
   
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:preview];
    [self presentViewController:nav animated:YES completion:nil];
    
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
