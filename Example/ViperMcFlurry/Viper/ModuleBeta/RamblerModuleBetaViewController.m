//
//  RamblerModuleBetaViewController.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleBetaViewController.h"
#import "RamblerModuleBetaViewOutput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@interface RamblerModuleBetaViewController()

@end

@implementation RamblerModuleBetaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output setupView];
}

- (void)setExampleString:(NSString *)exampleString {
    self.exampleStringLabel.text = exampleString;
}

@end