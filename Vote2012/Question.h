//
//  Question.h
//  Vote2012
//
//  Created by Patrick Crager on 9/11/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (strong) NSString *question;
@property (assign) BOOL obama;
@property (assign) BOOL romney;
@property (strong) NSURL *wikiUrl;
@property (assign) NSInteger questionNumber;

- (id)initWithQuestion:(NSString*)question
                 obama:(BOOL)obama
                romney:(BOOL)romney
        questionNumber:(NSInteger)questionNumber
                wikiUrl:(NSURL*)wikiUrl;

@end