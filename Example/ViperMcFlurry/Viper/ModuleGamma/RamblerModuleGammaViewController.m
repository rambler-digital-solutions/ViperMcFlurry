//
//  RamblerModuleGammaViewController.m
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import "RamblerModuleGammaViewController.h"
#import "RamblerModuleGammaViewOutput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@interface RamblerModuleGammaViewController()

@end

@implementation RamblerModuleGammaViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.output setupView];
}

- (void)setExampleString:(NSString *)exampleString {
    self.exampleStringLabel.text = exampleString;
}

@end
