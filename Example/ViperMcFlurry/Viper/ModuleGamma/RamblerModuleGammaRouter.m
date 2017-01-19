//
//  RamblerModuleGammaRouter.m
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import "RamblerModuleGammaRouter.h"

@implementation RamblerModuleGammaRouter

#pragma mark - RamblerModuleGammaRouterInput

- (void)removeModule {
    [self.transitionHandler closeCurrentModule:NO];
}

@end
