//
//  RewardViewController.m
//  WalletToWallet
//
//  Created by harish on 04/03/2014.
//  Copyright (c) 2014 Narendra. All rights reserved.
//

#import "RewardViewController.h"

@interface RewardViewController ()

@end

@implementation RewardViewController
@synthesize tblReport=_tblReport;
@synthesize reportArray=_reportArray;

+(RewardViewController *)initViewController{
    RewardViewController * recharge =[[RewardViewController alloc]initWithNibName:@"RewardViewController" bundle:[NSBundle mainBundle]];
    recharge.title =@"Reward Report";
    return recharge;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if ([[ReportList instance]getRewardReportList].count <= 0) {
        [[ActivityIndicator currentIndicator]displayActivity:@"Please wait..."];
    }
    [[ReportList instance]getRewardReportListByPage:1 Delegate:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    RewordReportInfo * rewardInfo =[_reportArray objectAtIndex:indexPath.row];
    CGSize constraint;
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        constraint  = CGSizeMake(CELL_CANTENT_WIDTH_IPAD - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    }else{
        constraint  = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
    }
   
    
    CGSize title_size = [rewardInfo.description sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize c_size;
    if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
    {
        c_size=CGSizeMake(320, title_size.height+2 + 31 + 30);
        return c_size.height;
    }
    
    return 93.0;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_reportArray count];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    ReportTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSArray *topLevelObject;
    if (cell == nil)
    {
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
            topLevelObject = [[NSBundle mainBundle] loadNibNamed:@"ReportTableCell_iPad" owner:self options:nil];
        }
        else
        {
            topLevelObject = [[NSBundle mainBundle] loadNibNamed:@"ReportTableCell" owner:self options:nil];
        }
        
        
        
        
        for(id currentObject in topLevelObject)
        {
            if([currentObject isKindOfClass:[UITableViewCell class]])
            {
                cell = (ReportTableCell*) currentObject;
            }
        }
        RewordReportInfo * rewardInfo =[_reportArray objectAtIndex:indexPath.row];
        [cell setData:rewardInfo];
        
        if ( UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad )
        {
        
        
        CGSize constraint;
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {

        constraint = CGSizeMake(CELL_CANTENT_WIDTH_IPAD - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        }else{
            constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        }
        
        CGSize Descriptionsize = [rewardInfo.description sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:NSLineBreakByWordWrapping];
        
        [cell.lblDec setFrame:CGRectMake(CELL_CONTENT_MARGIN,cell.lblDec.frame.origin.y, cell.lblDec.frame.size.width,Descriptionsize.height)];
        
        [cell.containerView setFrame:CGRectMake(5,cell.lblDec.frame.size.height + 36,cell.containerView.frame.size.width,cell.containerView.frame.size.height)];
        
        
        [cell.view setFrame:CGRectMake(5,1,cell.frame.size.width-10,cell.lblDec.frame.size.height +31+30)];
        
        [cell setFrame:CGRectMake(0,0,320,cell.view.frame.size.height)];
        [cell setFrame:CGRectMake(0,0,320,cell.frame.size.height)];
        
        
        }
    }
    
    return  cell;
    
}

#pragma mark -ModelListDelegate
-(void)ModelListLoadedSuccessfully{
    [[ActivityIndicator currentIndicator]displayCompleted];
    _reportArray = [[NSMutableArray alloc]init];
    _reportArray =  [[ReportList instance]getRewardReportList];
    [_tblReport reloadData];
    
}

-(void)ModelListLoadFailWithError:(NSString *)error{
    [[ActivityIndicator currentIndicator]displayCompleted];
    UIAlertView * alertView =[[UIAlertView alloc]initWithTitle:ALERT_TITLE message:error delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
