//
//  ChatListingScreen.m
//  MusicApp
//
//  Created by netset on 11/18/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "ChatListingScreen.h"

@interface ChatListingScreen ()

@end

@implementation ChatListingScreen

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
    label.text = NSLocalizedString(@"Messages", @"");
    [label sizeToFit];
    
    
    //    self.navigationItem.hidesBackButton=YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 11, 18);
    [button setBackgroundImage:[UIImage imageNamed:@"back_yellow"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
//    UIButton *btnHome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btnHome.frame = CGRectMake(0, 0, 21, 18);
//    [btnHome setBackgroundImage:[UIImage imageNamed:@"home_yellow"] forState:UIControlStateNormal];
//    [btnHome addTarget:self action:@selector(HomeButton:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *customBarItemHomeButton = [[UIBarButtonItem alloc] initWithCustomView:btnHome];
//    self.navigationItem.rightBarButtonItem = customBarItemHomeButton;
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)BackButton: (id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//-(void)HomeButton:(id)sender
//{
//    NSLog(@"Home Button pressed");
//    
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}


#pragma mark - UITableView Delegates
//#pragma UITableView Delegates

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 17;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    chatListCellObj = (ChatListCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if(chatListCellObj ==nil)
    {
        [[NSBundle mainBundle]loadNibNamed:@"ChatListCell" owner:self options:nil];
    }
    
    return chatListCellObj;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if (iPhone4)
    {
        chatScreenObj = [[ChatScreen alloc] initWithNibName:@"ChatScreen" bundle:nil];
    }
    else
    {
        chatScreenObj = [[ChatScreen alloc] initWithNibName:@"ChatScreen@5" bundle:nil];
    }
    
    [self.navigationController pushViewController:chatScreenObj animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}


@end
