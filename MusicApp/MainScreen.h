//
//  MainScreen.h
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "CliptionaryScreen.h"
#import "FriendsList.h"
#import "SettingsScreen.h"
#import "ChatListingScreen.h"

@interface MainScreen : UIViewController<MPMediaPickerControllerDelegate, UIGestureRecognizerDelegate, AVAudioPlayerDelegate>
{

    
    
    AVAudioPlayer *musicPlayer;
    
    BOOL touchedFirstTime;
    UIImageView *imgShadedArea;
    
    UIButton *btnLeft, *btnRight;
    
    double musicDuration, areaToBeShaded;

    CliptionaryScreen *cliptionaryScreenObj;
    FriendsList *friendListScreenObj;
    SettingsScreen *settingsScreenObj;
    ChatListingScreen *chatListingScreenObj;
    
    BOOL dontHideMe, textFieldIsUp;
    
    IBOutlet UIView *miniScreenViewOutlet;
    IBOutlet UIButton *btnMiniScreenUpDownOutlet;
    IBOutlet UIImageView *imgMusicGraphOutlet;
    IBOutlet UIView *miniScreenOutlet;
    IBOutlet UILabel *lblSongName;
    IBOutlet UILabel *lblArtistName;
    
    IBOutlet UIView *messageViewOutlet;
    
    int clippedSliderValue;
    double mainSliderValue;
    
    IBOutlet UIButton *btnPlayOutlet;
    IBOutlet UILabel *lblMainSliderTime;
    IBOutlet UILabel *lblclippedSliderTime;
    IBOutlet UISlider *clippedSlider;
    IBOutlet UISlider *mainSlider;
    IBOutlet UITextView *txtViewMessageOutlet;
    IBOutlet UILabel *lblSeconds;
}

- (IBAction)barBtniTunesMusic:(id)sender;
- (IBAction)barBtnPlay:(id)sender;
- (IBAction)barBtnSend:(id)sender;
- (IBAction)barBtnSaveOrSavedClips:(id)sender;
- (IBAction)btnMiniScreenUpDown:(id)sender;
- (IBAction)mainSliderAction:(id)sender;
- (IBAction)clippedSliderAction:(id)sender;

- (IBAction)btnPlay:(id)sender;



@end
