//
//  AppDelegate.m
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "AppDelegate.h"

#import "Flurry.h"
#import "Appirater.h"

@implementation AppDelegate

+ (AppDelegate *)delegate {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Flurry setCrashReportingEnabled:YES];
    [Flurry startSession:@"K9ST76VZYVJWRBQ2PFGV"];
    
    [Appirater setAppId:@"567889745"];
    [Appirater setDaysUntilPrompt:5];
    [Appirater setUsesUntilPrompt:5];
    [Appirater setSignificantEventsUntilPrompt:-1];
    [Appirater setTimeBeforeReminding:2];
    [Appirater appLaunched:YES];
//    [Appirater setDebug:YES];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *questionData = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                 options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    NSUInteger count = 1;
    for (NSDictionary *question in questionData[@"questions"]) {
        Question *q = [[Question alloc] initWithQuestion:question[@"question"]
                                                   obama:[[question objectForKey:@"obama"] boolValue]
                                                  romney:[[question objectForKey:@"romney"] boolValue]
                                          questionNumber:count
                                                 wikiUrl:[[NSURL alloc]initWithString:[question[@"wikiUrl"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
        [questions addObject:q];
        count++;
    }
    
    self.questions = [NSArray arrayWithArray:questions];
    self.answers = [[NSMutableArray alloc] init];
    self.complete = NO;
    
    return YES;
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [Appirater appEnteredForeground:YES];
}

@end