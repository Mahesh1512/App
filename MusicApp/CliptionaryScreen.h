//
//  CliptionaryScreen.h
//  MusicApp
//
//  Created by netset on 10/29/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CliptionaryCell.h"

@interface CliptionaryScreen : UIViewController
{
    IBOutlet CliptionaryCell *cliptionaryCellObj;
    
    IBOutlet UIButton *btnEditButtonOutlet;
    IBOutlet UIButton *btnShareOutlet;
    IBOutlet UIButton *btnDeleteOutlet;
    IBOutlet UIToolbar *bottomtoolbarOutlet;
    
    NSIndexPath *lastSelectedIndex;
    
    BOOL slideMeLeft;
    IBOutlet UITableView *cliptionaryTableViewOutlet;
    
    UIButton *btnHome;
}

- (IBAction)btnPlayPause:(id)sender event:(id)event;

@end
