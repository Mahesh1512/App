//
//  RegistrationScreen.m
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "RegistrationScreen.h"

@interface RegistrationScreen ()

@end

@implementation RegistrationScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:17.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Phone Number Verification", @"");
    [label sizeToFit];
    

}

-(void)viewWillAppear:(BOOL)animated
{
//    [self btnNext:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnNext:(id)sender
{
    StrNavText = @"abcd";
    
    if (iPhone5)
    {
        verificationScreenObj = [[VerificationScreen alloc] initWithNibName:@"VerificationScreen@5" bundle:nil];
    }
    else if (iPhone4)
    {
        verificationScreenObj = [[VerificationScreen alloc] initWithNibName:@"VerificationScreen" bundle:nil];
    }
    
    [self.navigationController pushViewController:verificationScreenObj animated:YES];
    
}

- (IBAction)keyBoardResign:(id)sender
{
    [[self view] endEditing:TRUE];

}
@end
