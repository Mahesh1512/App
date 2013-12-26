//
//  FriendsList.h
//  MusicApp
//
//  Created by netset on 11/14/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendCell.h"
#import "ContactCell.h"
#import "ChatScreen.h"
#import <MessageUI/MessageUI.h>


@interface FriendsList : UIViewController<UIActionSheetDelegate, MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate>
{
    IBOutlet FriendCell *friendCellObj;
    IBOutlet ContactCell *contactCellObj;
    IBOutlet UISegmentedControl *segfriendContactsOutlet;
    IBOutlet UITableView *friendListTableOutlet;
    
    ChatScreen *chatScreenObj;
    
    
    NSMutableArray *phoneContacts;
    NSDictionary *userContacts;
    
    UIActionSheet *invitationActionSheetEmail, *invitationActionSheetSMS, *invitationActionSheetBoth;
    
    MFMessageComposeViewController *smsController;
    MFMailComposeViewController *emailSender;

    NSIndexPath *selectedIndex;

}

- (IBAction)segfriendContactsAction:(id)sender;

@end
