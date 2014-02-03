//
//  ViewController.h
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

#import "Question.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;
@property (weak, nonatomic) IBOutlet UIImageView *segmentedImage;
@property (weak, nonatomic) IBOutlet UIImageView *background;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIButton *explain;

- (IBAction)back:(id)sender;
- (IBAction)segSwitch:(id)sender;

@end