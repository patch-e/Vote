//
//  AppDelegate.h
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "Question.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (assign, nonatomic) BOOL complete;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSMutableArray *answers;

+ (AppDelegate *)delegate;

@end