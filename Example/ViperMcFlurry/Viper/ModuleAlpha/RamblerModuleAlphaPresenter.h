//
//  RamblerModuleAlphaPresenter.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleAlphaViewOutput.h"
#import "RamblerModuleAlphaInteractorOutput.h"

@protocol RamblerModuleAlphaViewInput;
@protocol RamblerModuleAlphaInteractorInput;
@protocol RamblerModuleAlphaRouterInput;

@interface RamblerModuleAlphaPresenter : NSObject <RamblerModuleAlphaViewOutput, RamblerModuleAlphaInteractorOutput>

@property (nonatomic, weak) id<RamblerModuleAlphaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleAlphaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleAlphaRouterInput> router;

@end

