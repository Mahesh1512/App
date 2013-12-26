//
//  RegistrationScreen.h
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerificationScreen.h"

@class VerificationScreen;
@interface RegistrationScreen : UIViewController
{
    VerificationScreen *verificationScreenObj;
}
- (IBAction)btnNext:(id)sender;
- (IBAction)keyBoardResign:(id)sender;
@end
