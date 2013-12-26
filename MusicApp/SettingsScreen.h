//
//  SettingsScreen.h
//  MusicApp
//
//  Created by netset on 11/16/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsCell.h"
#import "TermsScreen.h"
#import "PrivacyPolicyScreen.h"

@interface SettingsScreen : UIViewController<UIActionSheetDelegate>
{
   IBOutlet SettingsCell *settingsCellObj;

    
    
    
    //======Local=======
    
    
    
    TermsScreen *termsScreenObj;
    PrivacyPolicyScreen *privacyPolicyScreenObj;
    
    
    
    NSArray *SettingsMenuOptions;
    
    //==================
}
@end
