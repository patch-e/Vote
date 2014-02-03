//
//  WebViewController.m
//  Vote
//
//  Created by Patrick Crager on 10/2/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "WebViewController.h"

#import "AppDelegate.h"
#import "Question.h"
#import "Flurry.h"

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"here");
    [self.webView loadRequest:[NSURLRequest requestWithURL:[AppDelegate delegate].currentQuestion.wikiUrl]];
    
    [[self webView] setDelegate: self];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setActivityIndicator:nil];
    [self setBackButton:nil];
    [self setForwardButton:nil];
    [super viewDidUnload];
}

- (IBAction)goBack:(id)sender
{
    [self.webView goBack];
}

- (IBAction)goForward:(id)sender
{
    [self.webView goForward];
}

- (IBAction)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [Flurry logEvent:@"Back"];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityIndicator stopAnimating];
    
    if ([self.webView canGoBack])
        [self.backButton setEnabled:YES];
    else
        [self.backButton setEnabled:NO];
    
    if ([self.webView canGoForward])
        [self.forwardButton setEnabled:YES];
    else
        [self.forwardButton setEnabled:NO];
}

@end