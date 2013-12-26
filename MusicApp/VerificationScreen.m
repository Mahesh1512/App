//
//  VerificationScreen.m
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "VerificationScreen.h"

@interface VerificationScreen ()

@end

@implementation VerificationScreen

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
    lblNav = [[UILabel alloc] initWithFrame:CGRectZero] ;

    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 11, 18);
    [button setBackgroundImage:[UIImage imageNamed:@"back_yellow"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;

    
}

-(void)viewWillAppear:(BOOL)animated
{
    //    [self btnNext:self];
    
    NSLog(@"%@", StrNavText);
    
    
    lblNav.backgroundColor = [UIColor clearColor];
    lblNav.font = [UIFont boldSystemFontOfSize:17.0];
    lblNav.textAlignment = NSTextAlignmentCenter;
    lblNav.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = lblNav;
    lblNav.text = NSLocalizedString(StrNavText, @"");
    [lblNav sizeToFit];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)BackButton:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)btnNext:(id)sender
{

    if (iPhone4)
    {
        profileScreenObj = [[ProfileScreen alloc] initWithNibName:@"ProfileScreen" bundle:nil];
    }
    else
    {
        profileScreenObj = [[ProfileScreen alloc] initWithNibName:@"ProfileScreen@5" bundle:nil];
    }
    
    [self.navigationController pushViewController:profileScreenObj animated:YES];

}
@end
