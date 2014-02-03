//
//  ResultsViewController.h
//  Vote
//
//  Created by Patrick Crager on 9/10/12.
//  Copyright (c) 2012 Patrick Crager. All rights reserved.
//

@interface ResultsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;
@property (weak, nonatomic) IBOutlet UIView *calculatingView;

- (IBAction)startOver:(id)sender;

@end