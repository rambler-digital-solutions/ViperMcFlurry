//
//  RamblerModuleBetaPresenter.m
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import "RamblerModuleBetaPresenter.h"
#import "RamblerModuleBetaViewInput.h"
#import "RamblerModuleBetaInteractorInput.h"
#import "RamblerModuleBetaRouterInput.h"

@interface RamblerModuleBetaPresenter()

@property (nonatomic,strong) NSString* exampleString;

@end

@implementation RamblerModuleBetaPresenter

#pragma mark - RamblerModuleBetaInput

- (void)configureWithExampleString:(NSString*)exampleString {
    self.exampleString = exampleString;
}

#pragma mark - RamblerModuleBetaViewOutput

- (void)setupView {
    [self.view setExampleString:self.exampleString];
}

#pragma mark - RamblerModuleBetaInteractorOutput

@end