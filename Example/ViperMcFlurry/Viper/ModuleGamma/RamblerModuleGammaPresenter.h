//
//  RamblerModuleGammaPresenter.h
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleGammaViewOutput.h"
#import "RamblerModuleGammaInteractorOutput.h"
#import "RamblerModuleGammaInput.h"

@protocol RamblerModuleGammaViewInput;
@protocol RamblerModuleGammaInteractorInput;
@protocol RamblerModuleGammaRouterInput;

@interface RamblerModuleGammaPresenter : NSObject <RamblerModuleGammaViewOutput, RamblerModuleGammaInteractorOutput, RamblerModuleGammaInput>

@property (nonatomic, weak) id<RamblerModuleGammaViewInput> view;
@property (nonatomic, strong) id<RamblerModuleGammaInteractorInput> interactor;
@property (nonatomic, strong) id<RamblerModuleGammaRouterInput> router;

@end

