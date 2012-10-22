//
//  ResultsViewController.m
//  Vote2012
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "ResultsViewController.h"

#import "AppDelegate.h"
#import <Twitter/Twitter.h>
#import <MessageUI/MessageUI.h>
#import "Flurry.h"

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    if (appDelegate.complete == YES) {
        [self performSelector:@selector(showResults) withObject:nil afterDelay:3.0];
    } else {
        [self calculateResults];
    }
    
    [Flurry logPageView];
}

- (void)viewDidUnload
{
    [self setResultLabel:nil];
    [self setResultImage:nil];
    [self setStartOver:nil];
    [self setShare:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)calculateResults
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
    NSInteger obama = 0;
    NSInteger romney = 0;
    for (int i = 0; i < appDelegate.answers.count; i++) {
        if (appDelegate.answers[i] == @"Obama") {
            obama++;
        } else {
            romney++;
        }
    }
    
    NSLog(@"Obama: %d", obama);
    NSLog(@"Romney: %d", romney);
    
    if (obama > romney) {
        [self.resultLabel setText:@"Barack Obama"];
        [self.resultImage setImage:[UIImage imageNamed: @"obama.png"]];
    } else {
        [self.resultLabel setText:@"Mitt Romney"];
        [self.resultImage setImage:[UIImage imageNamed: @"romney.png"]];
    }
}

- (void)showResults
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.complete = NO;
    
    [self performSegueWithIdentifier:@"results" sender:self];
    
    [Flurry logEvent:@"Show Results"];
}

- (IBAction)facebookShare:(id)sender
{
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) {
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
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:@"Facebook sharing requires iOS 6."
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

    if ([TWTweetComposeViewController canSendTweet]) {
        TWTweetComposeViewController *tweetSheet = [[TWTweetComposeViewController alloc] init];

        [tweetSheet setInitialText:tweet];
        
        [self presentModalViewController:tweetSheet animated:YES];
        
        tweetSheet = nil;
        return;
    }

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                        message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup in Settings."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    
    [Flurry logEvent:@"Twitter Share"];
}

- (IBAction)startOver:(id)sender
{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.answers = [NSMutableArray arrayWithCapacity:15];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    [Flurry logEvent:@"Start Over"];
}

@end