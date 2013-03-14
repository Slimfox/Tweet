//
//  ViewController.m
//  Tweet
//
//  Created by Brett Dupree on 2013-03-04.
//  Copyright (c) 2013 Brett Dupree. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)TweetToTwitter:(id)sender 
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *twitter = [[SLComposeViewController alloc] init];
        
        twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        [twitter setInitialText:[NSString stringWithFormat:@"Sending from iOS 6 - xCode 4.5"]];
        [self presentViewController:twitter animated:YES completion:nil];
        
        [twitter setCompletionHandler:^(SLComposeViewControllerResult result) {
            NSString *output;
            
            switch (result) {
                case SLComposeViewControllerResultCancelled:
                    output = @"Action Cancelled";
                    break;
                    
                case SLComposeViewControllerResultDone:
                    output = @"Tweet Succesfull";
                    break;
                
                default:
                    break;
                    
            }
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter" message:output delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [alert show];
        }];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
