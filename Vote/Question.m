//
//  Question.m
//  Vote
//
//  Created by Patrick Crager on 9/11/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "Question.h"

@implementation Question

- (id)init
{
    return [self initWithQuestion:@""
                            obama:NO
                           romney:NO
                   questionNumber:0
                          wikiUrl:nil];
}

- (id)initWithQuestion:(NSString*)question
                 obama:(BOOL)obama
                romney:(BOOL)romney
        questionNumber:(NSUInteger)questionNumber
               wikiUrl:(NSURL *)wikiUrl
{
    if (self = [super init]) {
        self.question = question;
        self.obama = obama;
        self.romney = romney;
        self.questionNumber = questionNumber;
        self.wikiUrl = wikiUrl;
    }
    
    return self;
}

@end