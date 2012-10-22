//
//  WebViewController.m
//  Vote2012
//
//  Created by Patrick Crager on 10/2/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "WebViewController.h"

#import "AppDelegate.h"
#import "Question.h"
#import "Flurry.h"

@implementation WebViewController

- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}

- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
    NSLog(@"started loading");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
    
    if ([self.webView canGoBack])
        [self.backButton setEnabled:YES];
    else
        [self.backButton setEnabled:NO];
    
    if ([self.webView canGoForward])
        [self.forwardButton setEnabled:YES];
    else
        [self.forwardButton setEnabled:NO];
    NSLog(@"finished loading");
}


- (IBAction)close:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
    
    [Flurry logEvent:@"Back"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    [self.webView loadRequest:[NSURLRequest requestWithURL:appDelegate.currentQuestion.wikiUrl]];
    
    [[self webView] setDelegate: self];
}

@end
