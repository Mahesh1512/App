//
//  MainScreen.m
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "MainScreen.h"
#import "AppDelegate.h"
#import "WaveformImageVew.h"


@interface MainScreen ()

@end

@implementation MainScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    musicDuration = 240.000000;
//    UITapGestureRecognizer *singleFingerTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
//    singleFingerTap.delegate = self;
//    [imgMusicGraphOutlet addGestureRecognizer:singleFingerTap];
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    
    UIButton *btnInbox = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnInbox.frame = CGRectMake(0, 0, 35,25);
//    [btnInbox setTitle:@"Inb." forState:UIControlStateNormal];
    [btnInbox setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    [btnInbox addTarget:self action:@selector(InboxButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customInbox = [[UIBarButtonItem alloc] initWithCustomView:btnInbox];
    //    self.navigationItem.leftBarButtonItem = customSettings;
    
    UIButton *btnSettings = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnSettings.frame = CGRectMake(0, 0, 35,25);
//    [btnSettings setTitle:@"Sett." forState:UIControlStateNormal];
    [btnSettings setBackgroundImage:[UIImage imageNamed:@"settings"] forState:UIControlStateNormal];
    [btnSettings addTarget:self action:@selector(SettingsButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customSettings = [[UIBarButtonItem alloc] initWithCustomView:btnSettings];
    
    UIButton *btnContact = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnContact.frame = CGRectMake(0, 0, 35,25);
//    [btnContact setTitle:@"Cont." forState:UIControlStateNormal];
    [btnContact setBackgroundImage:[UIImage imageNamed:@"contacts"] forState:UIControlStateNormal];
    [btnContact addTarget:self action:@selector(ContactsButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customContacts = [[UIBarButtonItem alloc] initWithCustomView:btnContact];
    
    NSMutableArray *total_items = [[NSMutableArray alloc] init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    [total_items addObject:customInbox];
    [total_items addObject:flexSpace];
    [total_items addObject:customSettings];
    [total_items addObject:flexSpace];
    [total_items addObject:customContacts];
    
    self.navigationItem.leftBarButtonItems = total_items;
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage alloc] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];

    clippedSlider.enabled = NO;
    btnPlayOutlet.enabled = NO;

    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [txtViewMessageOutlet resignFirstResponder];
}

-(void)InboxButton:(id)sender
{
     NSLog(@"Inbox");
    
    if (iPhone4)
    {
        chatListingScreenObj = [[ChatListingScreen alloc] initWithNibName:@"ChatListingScreen" bundle:nil];
    }
    else
    {
        chatListingScreenObj = [[ChatListingScreen alloc] initWithNibName:@"ChatListingScreen@5" bundle:nil];
    }
    
    [self.navigationController pushViewController:chatListingScreenObj animated:YES];
    
}

-(void)SettingsButton:(id)sender
{
     NSLog(@"Settings");
    
    if (iPhone4)
    {
        settingsScreenObj = [[SettingsScreen alloc] initWithNibName:@"SettingsScreen" bundle:nil];
    }
    else
    {
        settingsScreenObj = [[SettingsScreen alloc] initWithNibName:@"SettingsScreen@5" bundle:nil];
    }
    
    [self.navigationController pushViewController:settingsScreenObj animated:YES];

}

-(void)ContactsButton:(id)sender
{
    NSLog(@"Contacts");
    
    if (iPhone4)
    {
        friendListScreenObj = [[FriendsList alloc] initWithNibName:@"FriendsList" bundle:nil];
    }
    else
    {
        friendListScreenObj = [[FriendsList alloc] initWithNibName:@"FriendsList@5" bundle:nil];
    }
    
    [self.navigationController pushViewController:friendListScreenObj animated:YES];
    
}


- (IBAction)barBtniTunesMusic:(id)sender
{
    
    MPMediaPickerController *picker =[[MPMediaPickerController alloc] initWithMediaTypes: MPMediaTypeMusic];
    picker.delegate = self;
    picker.allowsPickingMultipleItems = NO;
    
    picker.prompt = NSLocalizedString (@"Select any song from the list", @"Prompt to user to choose some songs to play");
    
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (IBAction)barBtnPlay:(id)sender
{
    
}

- (IBAction)barBtnSend:(id)sender
{
    
}

- (IBAction)barBtnSaveOrSavedClips:(id)sender
{
    isFromHomeScreen = YES;
    
    if (iPhone4)
    {
        cliptionaryScreenObj = [[CliptionaryScreen alloc] initWithNibName:@"CliptionaryScreen" bundle:nil];
    }
    else
    {
        cliptionaryScreenObj = [[CliptionaryScreen alloc] initWithNibName:@"CliptionaryScreen@5" bundle:nil];
    }

    [self.navigationController pushViewController:cliptionaryScreenObj animated:YES];
}

- (IBAction)btnMiniScreenUpDown:(id)sender
{
    
    [UIView animateWithDuration:0.7
                           delay:0.0
                         options:UIViewAnimationOptionAllowAnimatedContent
                      animations:^{
                          
                          CGRect rect = miniScreenViewOutlet.frame;

                          
                          if (!dontHideMe)  //-----Down-----
                          {
                              
                              if (iPhone4)
                              {
                                  rect.origin.y = 398.0;
                              }
                              else
                              {
                                  rect.origin.y = 485.0;
                              }
                              
                          }
                          else   //---------Up---------
                          {
                              
                              if (iPhone4)
                              {
                                  rect.origin.y = 82.0;
                              }
                              else
                              {
                                  rect.origin.y = 170.00;
                              }
                              
                          }
                          
                          miniScreenViewOutlet.frame=rect;
                          
                      }
                      completion:^(BOOL finished) {
                          
                          [UIView animateWithDuration:2.0
                                                delay:0.0
                                              options:UIViewAnimationOptionAllowAnimatedContent
                                           animations:^{
                                               
                                               if (!dontHideMe)  //-----Down-----
                                               {
                                                   dontHideMe = YES;
                                                   [btnMiniScreenUpDownOutlet setBackgroundImage:[UIImage imageNamed:@"white_arrow"] forState:UIControlStateNormal];
                                                   
                                               }
                                               else      //-----Up-----
                                               {
                                                   dontHideMe = NO;
                                                   [btnMiniScreenUpDownOutlet setBackgroundImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
                                               }
                                           }
                                           completion:nil
                           ];
                          
                            }];
    
}

- (IBAction)mainSliderAction:(id)sender
{
    UISlider *MYslider = (UISlider *)sender;
    mainSliderValue = (double)(MYslider.value);
    
    NSLog(@"mainSliderValue : %f",mainSliderValue);
    
    lblMainSliderTime.text = [NSString stringWithFormat:@"%.2f", mainSliderValue];
    
    clippedSlider.enabled = YES;
   
    
    lblclippedSliderTime.text = [NSString stringWithFormat:@"%.2f", mainSliderValue];

    clippedSlider.minimumValue=-15;
    clippedSlider.maximumValue=15;
    
    [clippedSlider setValue:0 animated:YES];

}

- (IBAction)clippedSliderAction:(id)sender
{
     btnPlayOutlet.enabled = YES;
    
    UISlider *MYslider = (UISlider *)sender;
    clippedSliderValue = (int)(MYslider.value);
    lblSeconds.text = [NSString stringWithFormat:@"%d s", ABS(clippedSliderValue)];
   
    NSLog(@"lblSeconds : %@",lblSeconds.text);

//    lblclippedSliderTime.text=
    
   
    
    
}

- (IBAction)btnPlay:(id)sender
{
    long start;
     long end;
    
    if(clippedSliderValue > 0)
    {
        start = mainSliderValue;
        end = clippedSliderValue;

//        NSNumber *k = start+end;
        
        NSLog(@"SliderValue > 0 \nStart: %.2ld, End: %.2ld",start,end);
    }
    else
    {
        end = mainSliderValue;
        start = (end*60+clippedSliderValue)/60;
        
        NSLog(@"SliderValue < 0 \nStart: %.2ld, End: %.2ld",start,end);
    }

    if (!musicPlayer.playing)
    {
        NSError *error;
        musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:assetURL error:&error];
        musicPlayer.delegate = self;
        
        if (error)
             NSLog(@"Error: %@",[error localizedDescription]);
        else
        {
//             NSLog(@"Playing from(ms): %f", mainSliderValue);
//            NSLog(@"Playing from(s): %f", mainSliderValue/60);
            
            
            if (clippedSliderValue > 0)
            {
                [musicPlayer setCurrentTime:mainSliderValue/60];

                [NSTimer scheduledTimerWithTimeInterval:(clippedSliderValue) target:self selector:@selector(pause:) userInfo:nil repeats:NO];
            }
            else
            {
                [musicPlayer setCurrentTime:(mainSliderValue/60)-clippedSliderValue];

                
                
                [NSTimer scheduledTimerWithTimeInterval:(ABS(clippedSliderValue)) target:self selector:@selector(pause:) userInfo:nil repeats:NO];
            }
            
            [musicPlayer play];


        }
    }

   
}

- (void)pause:(id)sender {
    [musicPlayer pause];
}


#pragma  mark - audio player delegate

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
//   [btnPlayOutlet setBackgroundImage:[UIImage imageNamed:@"play_btn"] forState:UIControlStateNormal];
    [musicPlayer stop];
    
}
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{
     NSLog(@"Decode Error occurred: %@", [error localizedDescription]);
}


#pragma  mark - UITextView Delegate
#pragma maark

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSLog(@"Editing Enabled");
    
    if (!dontHideMe)  //-----Bring mini Screen Down if its up-------
    {
        [self btnMiniScreenUpDown:self];
    }
    
    
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionAllowAnimatedContent
                     animations:^{
                         
                         CGRect rect = messageViewOutlet.frame;
                         
//                         if (textFieldIsUp)  //-----Down-----
//                         {
//                             textFieldIsUp = NO;

//                             if (iPhone4)
//                             {
//                                 rect.origin.y = 398.0;
//                             }
//                             else
//                             {
//                                 rect.origin.y = 523.0;
//                             }
//                             
//                         }
                        // else   //---------Up---------
                         {
                             textFieldIsUp = YES;
                             
                             if (iPhone4)
                             {
                                 rect.origin.y = 151.0;
                             }
                             else
                             {
                                 rect.origin.y = 307.0;
                             }
                             
                         }
                         
                         messageViewOutlet.frame=rect;
                         
                         
                         
                         
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:1.0
                                               delay:0.0
                                             options:UIViewAnimationOptionAllowAnimatedContent
                                          animations:^{
                                              
                                              CGRect rect = miniScreenViewOutlet.frame;
                                              
                                              if (textFieldIsUp)  //-----Animate UP with text message View-----
                                              {
                                                
                                                  if (iPhone4)
                                                  {
                                                      rect.origin.y = 398.0;
                                                  }
                                                  else
                                                  {
                                                      rect.origin.y = 269.0;
                                                  }

                                                   miniScreenViewOutlet.frame=rect;
                                                  
                                              }
                                              else      //-----Animate Down with text message View-----
                                              {
                                                  
                                              }
                                              
                                               miniScreenViewOutlet.frame=rect;
                                          }
                                          completion:nil
                          ];
                         
                     }];

    return YES;
}

#pragma  mark - Touch Events Delegate

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:miniScreenOutlet];

    
        CGPoint touchLocation = [touch locationInView:miniScreenOutlet];
    
        if (CGRectContainsPoint(imgMusicGraphOutlet.frame, touchLocation))
{

        if (!touchedFirstTime)
            {
               touchedFirstTime = YES;
     
                
                if (location.x >= imgMusicGraphOutlet.frame.origin.x + (areaToBeShaded/2) && location.x <= (imgMusicGraphOutlet.frame.origin.x+imgMusicGraphOutlet.frame.size.width) - (areaToBeShaded/2)) //23.5 && location.x <= 204.0)
                {
                    imgShadedArea = [[UIImageView alloc]initWithFrame:CGRectMake(location.x - areaToBeShaded/2, imgMusicGraphOutlet.frame.origin.y, areaToBeShaded, 88)];
                    
                    btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(imgShadedArea.frame.origin.x - 35,imgMusicGraphOutlet.center.y - 17.5, 35, 35)];
                    [btnLeft setImage:[UIImage imageNamed:@"smileys_ipad"] forState:UIControlStateNormal];
                    [btnLeft addTarget:self action:@selector(btnLeftAct:) forControlEvents:UIControlEventTouchUpInside];
                    
                    btnRight = [[UIButton alloc] initWithFrame:CGRectMake(imgShadedArea.frame.origin.x + imgShadedArea.frame.size.width, imgMusicGraphOutlet.center.y-17.5, 35, 35)];
                    [btnRight setImage:[UIImage imageNamed:@"smileys_ipad"] forState:UIControlStateNormal];
                    [btnRight addTarget:self action:@selector(btnRightAct:) forControlEvents:UIControlEventTouchUpInside];

                    
                }
                else
                {

                }
                
                imgShadedArea.backgroundColor = [UIColor grayColor];
                imgShadedArea.alpha = 0.5;
                [miniScreenOutlet addSubview:imgShadedArea];
                [miniScreenOutlet addSubview:btnLeft];
                [miniScreenOutlet addSubview:btnRight];

            }
            else
            {
    
 	              
                if (location.x >= imgMusicGraphOutlet.frame.origin.x + (areaToBeShaded/2) && location.x <= (imgMusicGraphOutlet.frame.origin.x+imgMusicGraphOutlet.frame.size.width) - (areaToBeShaded/2))
                {
                    imgShadedArea.frame = CGRectMake( location.x - (areaToBeShaded/2) ,imgMusicGraphOutlet.frame.origin.y, areaToBeShaded, 88);
                    
                    btnLeft.frame = CGRectMake(imgShadedArea.frame.origin.x - 35, imgMusicGraphOutlet.center.y - 17.5, 35, 35);
                    
                    btnRight.frame = CGRectMake(imgShadedArea.frame.origin.x + imgShadedArea.frame.size.width , imgMusicGraphOutlet.center.y-17.5, 35, 35);
                }
            }
//             NSLog(@"main %f", imgShadedArea.frame.origin.x);
        }
        else
        {
            
//            NSLog(@"outside");
//
//            NSLog(@"%f", location.x);

        }
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:miniScreenOutlet];
    
    
//    NSLog(@"touchesBegan:main %f", location.x);
//    NSLog(@"touchesBegan:image %f", imgMusicGraphOutlet.frame.origin.x + imgMusicGraphOutlet.frame.size.width);

    
//    if ([touch view] == imgMusicGraphOutlet)
//    {
    CGPoint touchLocation = [touch locationInView:miniScreenOutlet];
    if (CGRectContainsPoint(imgMusicGraphOutlet.frame, touchLocation))
    {
//        NSLog(@"======inside======");
        
        if (location.x >= imgMusicGraphOutlet.frame.origin.x + (areaToBeShaded/2) && location.x <= (imgMusicGraphOutlet.frame.origin.x+imgMusicGraphOutlet.frame.size.width) - (areaToBeShaded/2))
        {
            imgShadedArea.frame = CGRectMake( location.x - (areaToBeShaded/2),imgMusicGraphOutlet.frame.origin.y, areaToBeShaded, 88);
            
            btnLeft.frame = CGRectMake(imgShadedArea.frame.origin.x - 35, imgMusicGraphOutlet.center.y - 17.5, 35, 35);
            
            btnRight.frame = CGRectMake(imgShadedArea.frame.origin.x + imgShadedArea.frame.size.width , imgMusicGraphOutlet.center.y-17.5, 35, 35);

        }
    }
    else
    {

//        NSLog(@"outside");
//        NSLog(@"%f", location.x);

    }
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:imgMusicGraphOutlet];
    
}


-(void)btnLeftAct: (id) sender
{
    NSLog(@"left");
    
}

-(void)btnRightAct: (id) sender
{
    NSLog(@"Right");
    
}


#pragma  mark - audioImageGraph

-(UIImage *) audioImageGraph:(SInt16 *) samples
                normalizeMax:(SInt16) normalizeMax
                 sampleCount:(NSInteger) sampleCount
                channelCount:(NSInteger) channelCount
                 imageHeight:(float) imageHeight {
    
    CGSize imageSize = CGSizeMake(sampleCount, imageHeight);
    UIGraphicsBeginImageContext(imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetAlpha(context,1.0);
    CGRect rect;
    rect.size = imageSize;
    rect.origin.x = 0;
    rect.origin.y = 0;
    
    CGColorRef leftcolor = [[UIColor whiteColor] CGColor];
//    CGColorRef rightcolor = [[UIColor redColor] CGColor];
    
    CGContextFillRect(context, rect);
    
    CGContextSetLineWidth(context, 1.0);
    
    float halfGraphHeight = (imageHeight / 2) / (float) channelCount ;
    float centerLeft = halfGraphHeight;
//    float centerRight = (halfGraphHeight*3) ;
    float sampleAdjustmentFactor = (imageHeight/ (float) channelCount) / (float) normalizeMax;
    
    for (NSInteger intSample = 0 ; intSample < sampleCount ; intSample ++ ) {
        SInt16 left = *samples++;
        float pixels = (float) left;
        pixels *= sampleAdjustmentFactor;
        CGContextMoveToPoint(context, intSample, centerLeft-pixels);
        CGContextAddLineToPoint(context, intSample, centerLeft+pixels);
        CGContextSetStrokeColorWithColor(context, leftcolor);
        CGContextStrokePath(context);
//        
//        if (channelCount==2) {
//            SInt16 right = *samples++;
//            float pixels = (float) right;
//            pixels *= sampleAdjustmentFactor;
//            CGContextMoveToPoint(context, intSample, centerRight - pixels);
//            CGContextAddLineToPoint(context, intSample, centerRight + pixels);
//            CGContextSetStrokeColorWithColor(context, rightcolor);
//            CGContextStrokePath(context);
//        }
    }
    
    // Create new image
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Tidy up
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma  mark - MPMediaPickerController delegate

- (void) mediaPicker: (MPMediaPickerController *) mediaPicker didPickMediaItems: (MPMediaItemCollection *) mediaItemCollection
{
    
    //----fetching song name, artist name, song url----
    
    MPMediaItem *anItem = mediaItemCollection.representativeItem;
    
    assetURL = [anItem valueForProperty: MPMediaItemPropertyAssetURL];
    lblSongName.text = TitleStr = [anItem valueForProperty:MPMediaItemPropertyTitle];
    lblArtistName.text = ArtistStr = [anItem valueForProperty:MPMediaItemPropertyArtist];
    NSString *musicDurationStr = [anItem valueForProperty:MPMediaItemPropertyPlaybackDuration];
    
    NSLog(@"musicDurationStr: %@", musicDurationStr);

    musicDuration = [musicDurationStr doubleValue];
    
//    areaToBeShaded = ((260.0/musicDuration) * 15);
    
    mainSlider.minimumValue = 0.00;
    mainSlider.maximumValue = (double)musicDuration*60  ;
    
    NSLog(@"mainSlider.maximumValue: %f", mainSlider.maximumValue);
    
//    [mainSlider setValue:musicDuration animated:YES];
//    lblMainSliderTime.text = [NSString stringWithFormat:@"%.2f",musicDuration/60];
    
//    NSLog(@"%@",lblMainSliderTime.text);
//
//    NSLog(@"after %f", 260.0/musicDuration);
//    
//    NSLog(@"%f", musicDuration);
//    
//    NSLog(@"%f", (260.0/musicDuration) * 15);
//    
//    NSLog(@"Song - %@", (MPMediaItem *)[mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyTitle]);
//    NSLog(@"Artist - %@",  (MPMediaItem *)[mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyArtist]);
//    
//    //    lblSongName.text = [mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyTitle];
//    //    lblArtishName.text = [mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyArtist];
//    
////    MPMediaItemArtwork *itemArtwork = [mediaItemCollection.representativeItem valueForProperty:MPMediaItemPropertyArtwork];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^
//                   {
//                       
//                       dispatch_async(dispatch_get_main_queue(), ^
//                                      {
//                                          
//                                          [imgShadedArea removeFromSuperview];
//                                          [btnLeft removeFromSuperview];
//                                          [btnRight removeFromSuperview];
//                                          
//                                          touchedFirstTime = NO;
//
////                                          WaveformImageVew *waveObj = [[WaveformImageVew alloc] initWithUrl:assetURL];
////                                          imgMusicGraphOutlet.image = waveObj.image;
////
//                                          [HUD hide:YES];
//                                          
//                                      });
//                   });
//    
//    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES] ;
//    HUD.dimBackground = YES;
//    HUD.labelText = @"Preparing audio for clipping...";
//    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void) mediaPickerDidCancel: (MPMediaPickerController *) mediaPicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
