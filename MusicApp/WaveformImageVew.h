//
//  WaveformImageVew.h
//  MusicApp
//
//  Created by netset on 10/7/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>

@interface WaveformImageVew : UIImageView
{
    
}

-(id)initWithUrl:(NSURL*)url;
- (NSData *) renderPNGAudioPictogramLogForAssett:(AVURLAsset *)songAsset;

@end
