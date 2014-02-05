//
//  ViewController.m
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "ViewController.h"

#import "AppDelegate.h"
#import "Question.h"
#import "Flurry.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *appDelegate = [AppDelegate delegate];
    if (appDelegate.currentQuestion != nil) {
        [self.questionLabel setText:appDelegate.currentQuestion.question];
    }
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    if (screenHeight > 480) {
        [self.segmented setFrame:CGRectMake(20,396,280,100)];
    }
    else {
        [self.segmented setFrame:CGRectMake(20,308,280,100)];
    }
    
    [Flurry logPageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    CGFloat screenHeight = screenSize.height;
    if (screenHeight > 480) {
        [self.background setImage:[UIImage imageNamed: @"Default-568h@2x.png"]];
    }
    [self.segmentedImage setImage:[UIImage imageNamed:@"ballotbox.png"]];
}

- (void)viewDidAppear:(BOOL)animated
{
    AppDelegate *appDelegate = [AppDelegate delegate];
    if (appDelegate.currentQuestion != nil) {
        [self.progressView setProgress:(appDelegate.currentQuestion.questionNumber-1)/(float)15 animated:YES];
    }
}

- (void)viewDidUnload
{
    [self setSegmented:nil];
    [self setQuestionLabel:nil];
    [self setBackground:nil];
    [self setBack:nil];
    [self setExplain:nil];
    [self setStart:nil];
    [self setProgressView:nil];
    [self setSegmentedImage:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)back:(id)sender
{
    AppDelegate *appDelegate = [AppDelegate delegate];
    if (appDelegate.answers.count != 0) {
        [appDelegate.answers removeObjectAtIndex:appDelegate.answers.count-1];
        appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:appDelegate.answers.count];
    }
    
    [self.progressView setProgress:0.0f animated:NO];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [Flurry logEvent:@"Back"];
}

- (IBAction)segSwitch:(id)sender
{
    switch (self.segmented.selectedSegmentIndex)
    {
        case 0:
            [self.segmentedImage setImage:[UIImage imageNamed:@"ballotbox_yes.png"]];
            break;
        case 1:
            [self.segmentedImage setImage:[UIImage imageNamed:@"ballotbox_no.png"]];
            break;
        default:
            [self.segmentedImage setImage:[UIImage imageNamed:@"ballotbox.png"]];
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AppDelegate *appDelegate = [AppDelegate delegate];
    NSInteger answerCount = appDelegate.answers.count;
    
    if ([segue.identifier isEqualToString:@"start"]) {
        appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:0];
        
        [Flurry logEvent:@"Start"];
    } else if ([segue.identifier isEqualToString:@"explain"]) {
        [Flurry logEvent:@"Explain"];
    } else {
        if (answerCount == 0) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }

            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 1) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 2) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Romney"];
            } else {
                [appDelegate.answers addObject:@"Obama"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 3) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 4) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Romney"];
            } else {
                [appDelegate.answers addObject:@"Obama"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 5) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 6) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Romney"];
            } else {
                [appDelegate.answers addObject:@"Obama"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 7) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 8) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 9) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 10) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 11) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 12) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Romney"];
            } else {
                [appDelegate.answers addObject:@"Obama"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 13) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            appDelegate.currentQuestion = [appDelegate.questions objectAtIndex:answerCount+1];
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
        }
        
        if (answerCount == 14) {
            if (self.segmented.selectedSegmentIndex == 0) {
                [appDelegate.answers addObject:@"Obama"];
            } else {
                [appDelegate.answers addObject:@"Romney"];
            }
            
            [Flurry logEvent:[NSString stringWithFormat:@"Question %ld", answerCount+1]];
            
            appDelegate.complete = YES;
            [self performSegueWithIdentifier:@"results" sender:self];
        }
    }
}

@end