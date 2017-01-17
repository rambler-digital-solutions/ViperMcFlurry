//
//  RamblerModuleGammaInteractor.h
//  ViperMcFlurry
//
//  Copyright (c) 2017 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleGammaInteractorInput.h"

@protocol RamblerModuleGammaInteractorOutput;

@interface RamblerModuleGammaInteractor : NSObject <RamblerModuleGammaInteractorInput>

@property (nonatomic, weak) id<RamblerModuleGammaInteractorOutput> output;

@end

