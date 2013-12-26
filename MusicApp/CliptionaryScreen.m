//
//  CliptionaryScreen.m
//  MusicApp
//
//  Created by netset on 10/29/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "CliptionaryScreen.h"
#import "AppDelegate.h"

@interface CliptionaryScreen ()

@end

@implementation CliptionaryScreen

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
    
//    self.title = @"Cliptionary";
    
    
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:21.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Cliptionary", @"");
    [label sizeToFit];
    
    
    
//    self.navigationItem.hidesBackButton=YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 11, 18);
    [button setBackgroundImage:[UIImage imageNamed:@"back_yellow"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    
    btnHome = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnHome.frame = CGRectMake(0, 0, 21, 18);
    [btnHome setBackgroundImage:[UIImage imageNamed:@"home_yellow"] forState:UIControlStateNormal];
    [btnHome addTarget:self action:@selector(HomeButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItemHomeButton = [[UIBarButtonItem alloc] initWithCustomView:btnHome];
    self.navigationItem.rightBarButtonItem = customBarItemHomeButton;

    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];
    
    [bottomtoolbarOutlet setBackgroundImage:[UIImage imageNamed:@"cyan_bottom"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    [btnEditButtonOutlet setTitleColor:[UIColor colorWithRed:39.0/255.0 green:183.0/255.0 blue:197.0/255.0 alpha:1.0] forState:UIControlStateNormal];

}

-(void)viewWillAppear:(BOOL)animated
{
    btnShareOutlet.enabled = NO;
    btnEditButtonOutlet.enabled = NO;
    btnDeleteOutlet.enabled = NO;
    
    if (isFromHomeScreen)
    {
        btnHome.hidden = YES;
    }
    
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

-(void)HomeButton:(id)sender
{
    NSLog(@"Home Button pressed");
}

- (IBAction)btnPlayPause:(id)sender event:(id)event
{
    //-------detection for button in table--------
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:cliptionaryTableViewOutlet];
    NSIndexPath *indexPath = [cliptionaryTableViewOutlet indexPathForRowAtPoint:currentTouchPosition];
    
    NSLog(@"Play button tapped at section:%ld index: %ld", (long)indexPath.section, (long)indexPath.row);
}


#pragma mark - UITableView Delegates
#pragma UITableView Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section  // fixed font style. use custom view (UILabel) if you want something different
//{
//    if (section == 0)
//    {
//        return @"ABC";
//    }
//    else if (section  == 1)

// Please make sure the users last name is in the "Job Assigned To" area and also we need the dates on that table.
// When you hit the icon, instead of "Take your decision" change that to "Update Job Status" and have Approve/Edit/Delete as options.

//    {
//        return @"XYZ";
//
//    }
//    
//    return nil;
//}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    cliptionaryCellObj = (CliptionaryCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if(cliptionaryCellObj ==nil)
    {
        [[NSBundle mainBundle]loadNibNamed:@"CliptionaryCell" owner:self options:nil];
    }
    
  cliptionaryCellObj.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0)
    {
        cliptionaryCellObj.lblClipName.text = @"November 8, 2013 | h:mm AM/PM";

    }
    else if (indexPath.section == 1)
    {
        cliptionaryCellObj.lblClipName.text = @"Clipped song name";
    }
    
    return cliptionaryCellObj;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    btnShareOutlet.enabled = YES;
    btnEditButtonOutlet.enabled = YES;
    btnDeleteOutlet.enabled = YES;
    
    [btnShareOutlet setBackgroundImage:[UIImage imageNamed:@"shape1_active"] forState:UIControlStateNormal];
    [btnEditButtonOutlet setTitleColor:[UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] forState:UIControlStateNormal]; // yellow
    [btnDeleteOutlet setBackgroundImage:[UIImage imageNamed:@"trash_active"] forState:UIControlStateNormal];


    CliptionaryCell *lastSelectedCellObj = (CliptionaryCell *)[tableView cellForRowAtIndexPath:lastSelectedIndex];  //---last selected cell----
    lastSelectedCellObj.imgCellBackGround.image = [UIImage imageNamed:@"list_bg"];
    
    
    CliptionaryCell *currentSelectedCellObj = (CliptionaryCell *)[tableView cellForRowAtIndexPath:indexPath]; //----Current selected cell---------
    currentSelectedCellObj.imgCellBackGround.image = [UIImage imageNamed:@"yellow_list"];
    
    [UILabel animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         
                         
                         lastSelectedCellObj.btnPlayPauseOutlet.alpha = 0.0;
                         
                         //-----Lable Slide left / right---------

                         
                         CGRect rect = lastSelectedCellObj.lblClipName.frame;
                         rect.origin.x = 20.0;
                         lastSelectedCellObj.lblClipName.frame=rect;
                         
                         
                         CGRect rect1 = currentSelectedCellObj.lblClipName.frame;
                         rect1.origin.x = 60.0;
                         currentSelectedCellObj.lblClipName.frame=rect1;
                         
                         //-------------------------------------
                         
                         
                         //-----Change clip lable color---------
                         
                         lastSelectedCellObj.lblClipName.textColor = [UIColor colorWithRed:0.0/255.0 green:90.0/255.0 blue:109.0/255.0 alpha:1.0];
                         currentSelectedCellObj.lblClipName.textColor = [UIColor whiteColor];
                         
                         //-------------------------------------
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UILabel animateWithDuration:0.1
                                                delay:0.0
                                              options:UIViewAnimationOptionAllowAnimatedContent
                                           animations:^{
                                               
                                               currentSelectedCellObj.btnPlayPauseOutlet.alpha = 1.0;
                                               
                                               //-------Hide/show PLay button---------
                                               
//                                               lastSelectedCellObj.btnPlayPauseOutlet.hidden = YES;
//                                               currentSelectedCellObj.btnPlayPauseOutlet.hidden = NO;
                                               
                                               //-------------------------------------
                                               
                                           }

                         completion:nil];
                         
                         
                         
                         
                         
    
                         
                         }
     ];
    
    lastSelectedIndex = indexPath;

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
//    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 49)];

    UILabel *sectionLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 49)];
    
//    view.image = [UIImage imageNamed:@"cyan_bottom"];
    
    if (section == 0)
    {
        sectionLable.text = @"  Recent";
    }
    else if (section == 1)
    {
      sectionLable.text = @"  Saved Clips";
    }
    
    sectionLable.textColor = [UIColor whiteColor];
    sectionLable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cyan_bottom"]];
    
//    [view addSubview:sectionLable];
    
    return sectionLable;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
      return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 49;
}



@end
