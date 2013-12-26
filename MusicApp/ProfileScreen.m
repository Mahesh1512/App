//
//  ProfileScreen.m
//  Emotisong
//
//  Created by netset on 12/24/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "ProfileScreen.h"

@interface ProfileScreen ()

@end

@implementation ProfileScreen

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
    
     self.navigationItem.hidesBackButton=YES;
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:17.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Profile", @"");
    [label sizeToFit];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnNext:(id)sender
{
    if (iPhone4)
    {
        mainScreenObj = [[MainScreen alloc] initWithNibName:@"MainScreen" bundle:nil];
    }
    else if (iPhone5)
    {
        mainScreenObj = [[MainScreen alloc] initWithNibName:@"MainScreen@5" bundle:nil];
        
    }
    
    UINavigationController *mainNavObj = [[UINavigationController alloc] initWithRootViewController:mainScreenObj];
    
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [appDelegate.window setRootViewController:mainNavObj];
}
@end
