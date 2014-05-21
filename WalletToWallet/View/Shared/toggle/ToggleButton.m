//
//  SLToggleButton.m
//  Directory_iOS
//
//  Created by Avantar Developer on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ToggleButton.h"

@implementation ToggleButton

-(void)dealloc
{
    self.selectedState = nil;
    self.deselectedState = nil;
    
    //[super dealloc];
}

-(void)deselect
{
    self.selected = FALSE;
}

-(void)select
{
    
    
    self.selected = TRUE;
}

#pragma mark - Properties -

@synthesize selectedState = _selectedState;
@synthesize deselectedState = _deselectedState;

-(void)setSelectedState:(UIButton *)selectedState
{
    [selectedState removeTarget:self action:@selector(deselect) forControlEvents:UIControlEventTouchUpInside];
   // [selectedState retain];
   // [_selectedState release];
    
    _selectedState = selectedState;
    _selectedState.hidden = !_selected;
    [_selectedState addTarget:self action:@selector(deselect) forControlEvents:UIControlEventTouchUpInside];
}

-(void)setDeselectedState:(UIButton *)deselectedState
{
    [deselectedState removeTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
   // [deselectedState retain];
   // [_deselectedState release];
    
    _deselectedState = deselectedState;
    _deselectedState.hidden = _selected;
    [_deselectedState addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
}

-(BOOL)isSelected
{
    return _selected;
}

-(void)setSelected:(BOOL)selected
{
    [self setSelected:selected silent:FALSE];
}

-(void)singleSelection:(BOOL)selected
{
     if(selected)
     {
         _selectedState.hidden = FALSE;
     }
}

-(void)setSelected:(BOOL)selected silent:(BOOL) silent
{
    if (selected  != _selected)
    {
        if (selected)
        {
            _selected = TRUE;
            _selectedState.hidden = FALSE;
            _deselectedState.hidden = TRUE;
        }
        else
        {
            _selected = FALSE;
            
            _selectedState.hidden = TRUE;
            _deselectedState.hidden = FALSE;
        }
        
        if (!silent)
            [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
