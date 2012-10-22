//
//  AppDelegate.m
//  Vote2012
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "AppDelegate.h"

#import "Question.h"
#import "Flurry.h"
#import "Appirater.h"

@implementation AppDelegate

@synthesize complete = _complete;
@synthesize questions = _questions;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    Question *q1 = [[Question alloc] initWithQuestion:@"Do you support the bailout of the automobile industry?"
                                                obama:YES
                                               romney:NO
                                       questionNumber:1
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.m.wikipedia.org/wiki/Effects_of_the_2008–2010_automotive_industry_crisis_on_the_United_States" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q2 = [[Question alloc] initWithQuestion:@"Do you support the Health Care reforms passed in March 2010?"
                                                obama:YES
                                               romney:NO
                                       questionNumber:2
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.m.wikipedia.org/wiki/Patient_Protection_and_Affordable_Care_Act" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q3 = [[Question alloc] initWithQuestion:@"Do you feel raising the debt ceiling will have a negative impact on the economy?"
                                                obama:NO
                                               romney:YES
                                       questionNumber:3
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/United_States_debt-ceiling_crisis"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q4 = [[Question alloc] initWithQuestion:@"Do you feel sex education in schools should only include education on abstinence?"
                                                obama:NO
                                               romney:YES
                                       questionNumber:4
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Abstinence-only_sex_education"                                                                                    stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q5 = [[Question alloc] initWithQuestion:@"Do you support domestic oil drilling to lower gas prices?"
                                                obama:NO
                                               romney:YES
                                       questionNumber:5
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/United_States_offshore_drilling_debate"                                                                                    stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q6 = [[Question alloc] initWithQuestion:@"Do you feel we need additional federal regulations on gun control?"
                                                obama:YES
                                               romney:NO
                                       questionNumber:6
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Gun_politics_in_the_United_States"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q7 = [[Question alloc] initWithQuestion:@"Do you support the attack on Iraq in 2003?"
                                                obama:NO
                                               romney:YES
                                       questionNumber:7
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/2003_invasion_of_Iraq"                                                                                    stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q8 = [[Question alloc] initWithQuestion:@"Do you support same-sex marriage?"
                                                obama:YES
                                               romney:NO
                                       questionNumber:8
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Same-sex_marriage_in_the_United_States"                                                                                    stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q9 = [[Question alloc] initWithQuestion:@"Do you feel medical marijuana should be legal?"
                                                obama:YES
                                               romney:NO
                                       questionNumber:9
                                              wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Medical_cannabis_in_the_United_States"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];                                                                                    
    
    Question *q10 = [[Question alloc] initWithQuestion:@"Do you feel the top 1% of the wealthiest Americans should be taxed more heavily?"
                                                 obama:YES
                                                romney:NO
                                        questionNumber:10
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Income_tax_in_the_United_States"                                                                                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q11 = [[Question alloc] initWithQuestion:@"Do you support the legal option for abortion?"
                                                 obama:YES
                                                romney:NO
                                        questionNumber:11
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Abortion_in_the_United_States"                                                                                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q12 = [[Question alloc] initWithQuestion:@"Do you feel the federal government should fund embryonic stem cell research?"
                                                 obama:YES
                                                romney:NO
                                        questionNumber:12
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Stem_cell_controversy"                                                                                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q13 = [[Question alloc] initWithQuestion:@"Do you support tough interrogation techniques, such as waterboarding?"
                                                 obama:NO
                                                romney:YES
                                        questionNumber:13
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Waterboarding"                                                                                     stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q14 = [[Question alloc] initWithQuestion:@"Do you feel labor unions benefit their workers?"
                                                 obama:YES
                                                romney:NO
                                        questionNumber:14
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Labor_unions_in_the_United_States"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    Question *q15 = [[Question alloc] initWithQuestion:@"Do you feel a convicted felon should have the right to vote?"
                                                 obama:YES
                                                romney:NO
                                        questionNumber:15
                                               wikiUrl:[[NSURL alloc]initWithString:[@"http://en.wikipedia.org/wiki/Felony_disenfranchisement"stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    self.questions = [[NSArray alloc] initWithObjects:q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, nil];
    self.answers = [NSMutableArray arrayWithCapacity:15];
    self.complete = NO;
    
    [Flurry startSession:@"K9ST76VZYVJWRBQ2PFGV"];
    
    [Appirater setAppId:@"567889745"];
    [Appirater setDaysUntilPrompt:5];
    [Appirater setUsesUntilPrompt:5];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:2];
    [Appirater appLaunched:YES];
//    [Appirater setDebug:YES];
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [Appirater appEnteredForeground:YES];
}

@end
