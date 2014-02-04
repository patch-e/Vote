//
//  ResultsViewController.m
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "ResultsViewController.h"

#import "AppDelegate.h"
#import <Social/Social.h>
#import "Flurry.h"

@implementation ResultsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self calculateResults];
    
    [Flurry logPageView];
}

- (void)viewDidUnload
{
    [self setResultLabel:nil];
    [self setResultImage:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)startOver:(id)sender
{
    [[AppDelegate delegate].answers removeAllObjects];

    [self.navigationController popToRootViewControllerAnimated:NO];
    
    [Flurry logEvent:@"Start Over"];
}

- (void)calculateResults
{
    AppDelegate *appDelegate = [AppDelegate delegate];
    
    NSUInteger obama = 0;
    NSUInteger romney = 0;
    for (int i = 0; i < appDelegate.answers.count; i++) {
        if ([appDelegate.answers[i] isEqual:@"Obama"]) {
            obama++;
        } else {
            romney++;
        }
    }
    
    NSLog(@"Obama: %d", obama);
    NSLog(@"Romney: %d", romney);
    
    if (obama > romney) {
        [self.resultLabel setText:@"Barack Obama"];
        [self.resultImage setImage:[UIImage imageNamed:@"obama.png"]];
    } else {
        [self.resultLabel setText:@"Mitt Romney"];
        [self.resultImage setImage:[UIImage imageNamed:@"romney.png"]];
    }
    
    [self performSelector:@selector(closeCalculatingView) withObject:nil afterDelay:2];
}

- (void)closeCalculatingView {
    [UIView animateWithDuration:1
                     animations:^(void) {
                         self.calculatingView.alpha = 0.0;
                         self.calculatingView.transform = CGAffineTransformMakeScale(1.1, 1.1);
                     }
                     completion:^(BOOL finished) {
                         self.calculatingView.hidden = YES;
                     }];
}

@end