//
//  Question.m
//  Vote2012
//
//  Created by Patrick Crager on 9/11/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize question = _question;
@synthesize obama = _obama;
@synthesize romney = _romney;
@synthesize wikiUrl = _wikiUrl;
@synthesize questionNumber = _questionNumber;

- (id)init {
    return [self initWithQuestion:@""
                            obama:NO
                           romney:NO
                   questionNumber:0
                          wikiUrl:nil];
}

- (id)initWithQuestion:(NSString*)question
                 obama:(BOOL)obama
                romney:(BOOL)romney
        questionNumber:(NSInteger)questionNumber
               wikiUrl:(NSURL *)wikiUrl{
    if (self = [super init]) {
        self.question = question;
        self.obama = obama;
        self.romney = romney;
        self.questionNumber = questionNumber;
        self.wikiUrl = wikiUrl;
        
//        NSError *error;
//        NSStringEncoding encoding;
//        NSString *htmlFilePath = [[NSBundle mainBundle] pathForResource: @"Explanation"
//                                                                 ofType: @"html"];
//        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFilePath
//                                                     usedEncoding:&encoding
//                                                            error:&error];
//        
//        NSString *questionFilePath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"Question%d", questionNumber]
//                                                                     ofType: @"txt"];
//        NSString *questionString = [NSString stringWithContentsOfFile:questionFilePath
//                                                         usedEncoding:&encoding
//                                                                error:&error];
//        
//        NSString *html = [NSString stringWithFormat:htmlString, questionString];
//        self.explanation = html;
        
//        htmlFilePath = nil;
//        htmlString = nil;
//        questionFilePath = nil;
//        questionString = nil;
//        html = nil;
    }
    return self;
}

@end