//
//  CliptionaryCell.h
//  MusicApp
//
//  Created by netset on 10/29/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CliptionaryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgCellBackGround;
@property (strong, nonatomic) IBOutlet UILabel *lblClipName;
@property (strong, nonatomic) IBOutlet UIButton *btnPlayPauseOutlet;

@end
