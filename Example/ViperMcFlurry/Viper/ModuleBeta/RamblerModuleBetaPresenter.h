//
//  RamblerModuleBetaPresenter.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleBetaViewOutput.h"
#import "RamblerModuleBetaInteractorOutput.h"
#import "RamblerModuleBetaInput.h"

@protocol RamblerModuleBetaViewInput;
@protocol RamblerModuleBetaInteractorInput;
@protocol RamblerModuleBetaRouterInput;

@interface RamblerModuleBetaPresenter : NSObject <RamblerModuleBetaViewOutput, RamblerModuleBetaInteractorOutput, RamblerModuleBetaInput>

@property (nonatomic, weak) id<RamblerModuleBetaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleBetaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleBetaRouterInput> router;

@end

