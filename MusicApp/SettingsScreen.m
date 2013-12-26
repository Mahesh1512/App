//
//  SettingsScreen.m
//  MusicApp
//
//  Created by netset on 11/16/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "SettingsScreen.h"

@interface SettingsScreen ()

@end

@implementation SettingsScreen

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
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:21.0];
    //    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Settings", @"");
    [label sizeToFit];
    
    
    //    self.navigationItem.hidesBackButton=YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 11, 18);
    [button setBackgroundImage:[UIImage imageNamed:@"back_yellow"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    SettingsMenuOptions = [NSArray arrayWithObjects:@"Terms of Service",@"Privacy Policy",@"Delete My Account", nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];
}


-(void)BackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [SettingsMenuOptions count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    settingsCellObj = (SettingsCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if(settingsCellObj ==nil)
    {
        [[NSBundle mainBundle]loadNibNamed:@"SettingsCell" owner:self options:nil];
    }
    
    settingsCellObj.lblSettingsOptionName.text = [SettingsMenuOptions objectAtIndex:indexPath.row];
    
    return settingsCellObj;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (indexPath.row == 0)
    {
        if (iPhone4)
        {
            termsScreenObj = [[TermsScreen alloc] initWithNibName:@"TermsScreen" bundle:nil];
        }
        else
        {
            termsScreenObj = [[TermsScreen alloc] initWithNibName:@"TermsScreen@5" bundle:nil];
        }
        
        [self.navigationController pushViewController:termsScreenObj animated:YES];
        
    }
    else if (indexPath.row == 1)
    {
        if (iPhone4)
        {
            privacyPolicyScreenObj = [[PrivacyPolicyScreen alloc] initWithNibName:@"PrivacyPolicyScreen" bundle:nil];
        }
        else
        {
            privacyPolicyScreenObj = [[PrivacyPolicyScreen alloc] initWithNibName:@"PrivacyPolicyScreen@5" bundle:nil];
        }
        
        [self.navigationController pushViewController:privacyPolicyScreenObj animated:YES];

    }
    else
    {
        
    }
    
    
    
//    if (iPhone4)
//    {
//        chatScreenObj = [[ChatScreen alloc] initWithNibName:@"ChatScreen" bundle:nil];
//    }
//    else
//    {
//        chatScreenObj = [[ChatScreen alloc] initWithNibName:@"ChatScreen@5" bundle:nil];
//    }
//    
//    [self.navigationController pushViewController:chatScreenObj animated:YES];
    
}


@end
