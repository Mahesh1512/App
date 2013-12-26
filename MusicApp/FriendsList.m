//
//  FriendsList.m
//  MusicApp
//
//  Created by netset on 11/14/13.
//  Copyright (c) 2013 netset. All rights reserved.
//

#import "FriendsList.h"
#import <AddressBook/AddressBook.h>


@interface FriendsList ()

@end

@implementation FriendsList

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
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero] ;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:21.0];
    //    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    // ^-Use UITextAlignmentCenter for older SDKs.
    label.textColor = [UIColor colorWithRed:249.0/255.0 green:202.0/255.0 blue:3.0/255.0 alpha:1.0] ; // change this color (yellow)
    self.navigationItem.titleView = label;
    label.text = NSLocalizedString(@"Contacts", @"");
    [label sizeToFit];
    
    //    self.navigationItem.hidesBackButton=YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(0, 0, 11, 18);
    [button setBackgroundImage:[UIImage imageNamed:@"back_yellow"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(BackButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = customBarItem;
    
    phoneContacts = [[NSMutableArray alloc] init];

    
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

-(void)viewWillAppear:(BOOL)animated
{
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc ]init];
    
    
    //---------------------------------------------------
    
    // Request authorization to Address Book
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error) {
            // First time access has been granted, add the contact
            //            [self _addContactToAddressBook];
            
            
            [phoneContacts removeAllObjects];
            
            ABAddressBookRef addressBook = ABAddressBookCreate();
            CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
            for (int i = 0; i < ABAddressBookGetPersonCount(addressBook); i++) {
                ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
                
                NSString *contact = (NSString *)CFBridgingRelease(ABRecordCopyCompositeName(ref));
                
                // NSString* phone = nil;
                
                ABMultiValueRef phoneNumbers = ABRecordCopyValue(ref,kABPersonPhoneProperty);
                
                //  if (ABMultiValueGetCount(phoneNumbers) > 0) {
                
                NSString *phone = (__bridge_transfer NSString*)
                ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
                
                if (!phone)
                {
                    phone = @"";
                }
                
                //  }
                
                ABMutableMultiValueRef multiEmail = ABRecordCopyValue(ref, kABPersonEmailProperty);
                
                NSString *email = (__bridge NSString *) ABMultiValueCopyValueAtIndex(multiEmail, 0);
                
                // NSLog(@"email:- %@", email);
                
                if (!email)
                {
                    email = @"";
                }
                
                
                userContacts = [NSDictionary dictionaryWithObjectsAndKeys:(NSString *)contact,@"Name",phone,@"phone",email,@"email",nil];
                
                [phoneContacts addObject:userContacts];
            }
            
            // NSLog(@"%@",phoneContacts);
            
            // NSLog(@"%i",[phoneContacts count]);
            
            
        });
    }
    
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized) {
        // The user has previously given access, add the contact
        //        [self _addContactToAddressBook];
        
        [phoneContacts removeAllObjects];
        
        ABAddressBookRef addressBook = ABAddressBookCreate();
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        for (int i = 0; i < ABAddressBookGetPersonCount(addressBook); i++) {
            ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, i);
            
            NSString *contact = (NSString *)CFBridgingRelease(ABRecordCopyCompositeName(ref));
            
            // NSString* phone = nil;
            
            ABMultiValueRef phoneNumbers = ABRecordCopyValue(ref,kABPersonPhoneProperty);
            
            //  if (ABMultiValueGetCount(phoneNumbers) > 0) {
            
            NSString *phone = (__bridge_transfer NSString*)
            ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
            
            if (!phone)
            {
                phone = @"";
            }
            
            //  }
            
            //            NSString *email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(ABRecordCopyValue(ref, kABPersonEmailProperty), i);
            //            //            [allEmails addObject:email];
            
            
            ABMutableMultiValueRef multiEmail = ABRecordCopyValue(ref, kABPersonEmailProperty);
            
            NSString *email = (__bridge NSString *) ABMultiValueCopyValueAtIndex(multiEmail, 0);
            
            // NSLog(@"email:- %@", email);
            
            if (!email)
            {
                email = @"";
            }
            
            userContacts = [NSDictionary dictionaryWithObjectsAndKeys:(NSString *)contact,@"Name",phone,@"phone",email,@"email",nil];
            
            [phoneContacts addObject:userContacts];
        }
        
        // NSLog(@"%@",phoneContacts);
        
        // NSLog(@"%i",[phoneContacts count]);
        
    }
    
    else
        
    {
        // The user has previously denied access
        // Send an alert telling user to change privacy setting in settings app
        
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please change your privacy setting, to share contacts." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        
        [alert show];
        
    }
    
    //-----------------------------------------------

}

- (IBAction)segfriendContactsAction:(id)sender
{
    [friendListTableOutlet reloadData];
}


#pragma mark MFMailComposeViewControllerDelegate methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
   
    switch (result) {
    case MFMailComposeResultCancelled:
        
        NSLog(@"Mail Cancelled");
        
        break;
    case MFMailComposeResultFailed:
        
        NSLog(@"Mail Failed");
        
        break;
    case MFMailComposeResultSent:
        
        NSLog(@"Mail Sent");
        
        break;
    default:
        break;
	}
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - messageComposeViewController delegates

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
	switch (result) {
		case MessageComposeResultCancelled:
            
			 NSLog(@"Message Cancelled");
            
			break;
		case MessageComposeResultFailed:
            
             NSLog(@"Message Failed");
            
			break;
		case MessageComposeResultSent:
            
             NSLog(@"Message Sent");
            
			break;
		default:
			break;
	}
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - actionSheet delegates

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (actionSheet == invitationActionSheetSMS)
    {
        if (buttonIndex == 0)
        {
            // NSLog(@"Send sms to %@", [[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"phone"]);
            
            smsController = [[MFMessageComposeViewController alloc] init];
            if([MFMessageComposeViewController canSendText])
            {
                smsController.delegate = self;
                smsController.body = @"Invitation sms goes here.";
                smsController.recipients = [NSArray arrayWithObject:[[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"phone"]];
                smsController.messageComposeDelegate = self;
                [self presentViewController:smsController animated:YES completion:nil];
            }
        }
    }
    
    else if (actionSheet == invitationActionSheetEmail)
    {
        if (buttonIndex == 0)
        {
            // NSLog(@"Send Email to %@", [[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"email"]);
            
            
            emailSender =[[MFMailComposeViewController alloc] init];
            
            if ([MFMailComposeViewController canSendMail]){
                emailSender.mailComposeDelegate=self;
                NSString *emailaddress=[[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"email"];
                NSArray *emailID = [NSArray arrayWithObject:emailaddress];
                [emailSender setToRecipients:emailID];
                [emailSender setSubject:@"Music App"];
                [emailSender setMessageBody:@"Your Invitation Text Here." isHTML:NO];
                [self presentViewController:emailSender animated:YES completion:nil];
            }
            else
            {
                
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Email" message:@"No email accout found." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                
                [alert show];
                
                // NSLog(@"No email accout found.");
            }
            
        }
    }
    
    else
    {
        
        switch (buttonIndex)
        {
                
            case 0: // sms
                // NSLog(@"Send sms to %@", [[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"phone"]);
                
                
                smsController = [[MFMessageComposeViewController alloc] init];
                
                if([MFMessageComposeViewController canSendText])
                {
                    smsController.delegate = self;
                    smsController.body = @"Invitation sms goes here.";
                    smsController.recipients = [NSArray arrayWithObject:[[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"phone"]];
                    smsController.messageComposeDelegate = self;
                    [self presentViewController:smsController animated:YES completion:nil];
                }
                
                break;
                
            case 1: // E-mail
                // NSLog(@"Send Email to %@", [[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"email"]);
                
                
                emailSender =[[MFMailComposeViewController alloc] init];
                
                if ([MFMailComposeViewController canSendMail]){
                    emailSender.mailComposeDelegate=self;
                    NSString *emailaddress=[[phoneContacts objectAtIndex:selectedIndex.row] objectForKey:@"email"];
                    NSArray *emailID = [NSArray arrayWithObject:emailaddress];
                    [emailSender setToRecipients:emailID];
                    [emailSender setSubject:@"Music App"];
                    [emailSender setMessageBody:@"You Invitation Text Here." isHTML:NO];
                    [self presentViewController:emailSender animated:YES completion:nil];
                }
                else
                {
                    
                    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Email" message:@"No email accout found." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
                    
                    [alert show];
                    
                    // NSLog(@"No email accout found.");
                }
                
                
                
                break;
        }
    }
}



#pragma mark - UITableView Delegates
#pragma UITableView Delegates

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [phoneContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    if ([segfriendContactsOutlet selectedSegmentIndex] == 0)
    {
        friendCellObj = (FriendCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell1"];
        if(friendCellObj ==nil)
        {
            [[NSBundle mainBundle]loadNibNamed:@"FriendCell" owner:self options:nil];
        }
        
        //    friendCellObj.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //    friendCellObj.lblFriendName.text = [[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"Name"];
        
        return friendCellObj;
        

    }
    else if ([segfriendContactsOutlet selectedSegmentIndex] == 1)
    {
        contactCellObj = (ContactCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        if(contactCellObj ==nil)
        {
//            [[NSBundle mainBundle]loadNibNamed:@"ContactCell" owner:self options:nil];
            
            [[NSBundle mainBundle] loadNibNamed:@"ContactCell" owner:self options:nil];
        }
        
        //    friendCellObj.selectionStyle = UITableViewCellSelectionStyleNone;
        
        contactCellObj.lblContactName.text = [[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"Name"];
        
        return contactCellObj;

    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    selectedIndex = indexPath;
    
    NSLog(@"%@ = %@", [[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"Name"], [[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"phone"]);
    
    
    
    if ([segfriendContactsOutlet selectedSegmentIndex] == 0)
    {
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
    
    else if ([segfriendContactsOutlet selectedSegmentIndex] == 1)
    {
        if ([[[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"email"] isEqual:@""])
        {
            
            invitationActionSheetSMS = [[UIActionSheet alloc]initWithTitle:@"Select an invitation method" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"SMS", nil];
            invitationActionSheetSMS.actionSheetStyle = UIActionSheetStyleDefault;
            
            [invitationActionSheetSMS showInView:self.view];
            
        }
        else if ([[[phoneContacts objectAtIndex:indexPath.row] objectForKey:@"phone"] isEqual:@""])
            
        {
            invitationActionSheetEmail = [[UIActionSheet alloc]initWithTitle:@"Select an invitation method" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"E-mail", nil];
            invitationActionSheetEmail.actionSheetStyle = UIActionSheetStyleDefault;
            
            [invitationActionSheetEmail showInView:self.view];

        }
        else
        {
            invitationActionSheetBoth = [[UIActionSheet alloc]initWithTitle:@"Select an invitation method" delegate:self cancelButtonTitle:@"Cancel"destructiveButtonTitle:nil otherButtonTitles:@"SMS", @"E-mail", nil];
            invitationActionSheetBoth.actionSheetStyle = UIActionSheetStyleDefault;
            
            [invitationActionSheetBoth showInView:self.view];
            
        }

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([segfriendContactsOutlet selectedSegmentIndex] == 0)
    {
        return 64;

   }
   else if ([segfriendContactsOutlet selectedSegmentIndex] == 1)
   {
       return 58;

   }
 
   return 0;
}


@end
