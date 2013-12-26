//
//  ChatListingScreen.h
//  MusicApp
//
//  Created by netset on 11/18/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatListCell.h"
#import "ChatScreen.h"

@interface ChatListingScreen : UIViewController
{
    IBOutlet ChatListCell *chatListCellObj;
    
    ChatScreen *chatScreenObj;
}
@end
