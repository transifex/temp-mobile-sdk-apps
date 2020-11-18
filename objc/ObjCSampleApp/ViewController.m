//
//  ViewController.m
//  ObjCSampleApp
//
//  Created by Stelios Petrakis on 30/10/20.
//

#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *localizedString = NSLocalizedString(@"test string",
                                                  comment: @"Test comment");

    NSLog(@"%s -> %@",
          __PRETTY_FUNCTION__,
          localizedString);

    NSString * localizedMinutes = @"%#@d_unit_time@";
    
    int randomNumber = arc4random_uniform(5);

    NSString *localizedStringWithFormat1 = [NSString localizedStringWithFormat:localizedMinutes, 1];

    NSLog(@"%@", localizedStringWithFormat1);
    
    NSString *text = [NSString localizedStringWithFormat:localizedMinutes, randomNumber];

    NSLog(@"%@", text);
    
    NSString * localizedUnsignedMinutes = @"%#@u_unit_time@";
    NSString *localizedStringWithFormat2 = [NSString localizedStringWithFormat:localizedUnsignedMinutes, (unsigned int)3];
    
    NSLog(@"%@", localizedStringWithFormat2);
}


@end
