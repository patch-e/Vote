//
//  ShareViewController
//  Vote
//
//  Created by Patrick Crager on 2/2/14.
//  Copyright (c) 2014 Patrick Crager. All rights reserved.
//

#import "ShareViewController.h"

#import "AppDelegate.h"
#import <Social/Social.h>
#import "Flurry.h"

@implementation ShareViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [Flurry logPageView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)facebookShare:(id)sender
{
    NSError *error;
    NSStringEncoding encoding;
    NSString *facebookFilePath = [[NSBundle mainBundle] pathForResource: @"Facebook"
                                                                 ofType: @"txt"];
    NSString *facebookString = [NSString stringWithContentsOfFile:facebookFilePath
                                                     usedEncoding:&encoding
                                                            error:&error];
    NSString *facebook = [NSString stringWithFormat:facebookString, @""];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *share = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [share setInitialText:facebook];
        
        [self presentViewController:share animated:YES completion:nil];
        
        share = nil;
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"You can't post to Facebook right now, make sure your device has an internet connection and you have at least one Facebook account setup in Settings."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    [Flurry logEvent:@"Facebook Share"];
}

- (IBAction)twitterShare:(id)sender
{
    NSError *error;
    NSStringEncoding encoding;
    NSString *tweetFilePath = [[NSBundle mainBundle] pathForResource: @"Twitter"
                                                              ofType: @"txt"];
    NSString *tweetString = [NSString stringWithContentsOfFile:tweetFilePath
                                                  usedEncoding:&encoding
                                                         error:&error];
    NSString *tweet = [NSString stringWithFormat:tweetString, @""];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewController *share = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [share setInitialText:tweet];
        
        [self presentViewController:share animated:YES completion:nil];
        
        share = nil;
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup in Settings."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    [Flurry logEvent:@"Twitter Share"];
}

@end