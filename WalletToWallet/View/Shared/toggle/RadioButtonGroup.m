//
//  RadioButtonGroup.m
//  TopBlip
//
//  Created by Avantar Developer on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RadioButtonGroup.h"
#import "ToggleButton.h"

@implementation RadioButtonGroup

-(void)dealloc
{
   // [_radioButtons release];
    
   // [super dealloc];
}

-(NSMutableArray*)radioButtons
{
    if (_radioButtons == nil)
    {
        _radioButtons = [[NSMutableArray alloc] init];
    }
    
    return _radioButtons;
}

-(void)addSubview:(UIView *)view
{
    [super addSubview:view];
    
    if ([view isKindOfClass:[ToggleButton class]])
    {
        ToggleButton *toggleButton = (ToggleButton*)view;
        [toggleButton addTarget:self action:@selector(buttonChanged:) forControlEvents:UIControlEventValueChanged];
        [[self radioButtons] addObject:toggleButton];
    }
}

-(void)willRemoveSubview:(UIView *)subview
{
    if ([subview isKindOfClass:[ToggleButton class]])
        [[self radioButtons] removeObject:subview];
}

-(void)buttonChanged:(id)sender
{
    for (ToggleButton *button in _radioButtons)
    {
        [button setSelected:sender == button silent:TRUE];
    }
}

@end
