//
//  VerificationScreen.h
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileScreen.h"

NSString *StrNavText;

@class ProfileScreen;
@interface VerificationScreen : UIViewController
{

    ProfileScreen *profileScreenObj;
    
    
    //=======Local Dec======
    
    UILabel *lblNav;
    
    
    //======================
}

- (IBAction)btnNext:(id)sender;
- (IBAction)KeyBoardResign:(id)sender;

@end
