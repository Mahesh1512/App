//
//  AppDelegate.h
//  MusicApp
//
//  Created by netset on 10/5/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistrationScreen.h"
#import "MBProgressHUD.h"

NSString *ArtistStr, *TitleStr;
NSURL *assetURL;

MBProgressHUD *HUD;

BOOL isFromHomeScreen;

@class RegistrationScreen;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    RegistrationScreen *registrationScreenObj;
    UINavigationController *navObj;
}

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
