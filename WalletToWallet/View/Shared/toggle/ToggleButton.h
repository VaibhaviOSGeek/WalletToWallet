//
//  SLToggleButton.h
//  Directory_iOS
//
//  Created by Avantar Developer on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToggleButton : UIControl
{
    UIButton *_selectedState;
    UIButton *_deselectedState;
    
    BOOL _selected;
}

@property (nonatomic, readwrite, retain) IBOutlet UIButton *selectedState;
@property (nonatomic, readwrite, retain) IBOutlet UIButton *deselectedState;

-(void)setSelected:(BOOL)selected;
-(void)setSelected:(BOOL)selected silent:(BOOL) silent;
-(void)singleSelection:(BOOL)selected;;

@end
