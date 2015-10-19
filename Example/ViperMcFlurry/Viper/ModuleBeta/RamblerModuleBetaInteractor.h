//
//  RamblerModuleBetaInteractor.h
//  ViperMcFlurry
//
//  Copyright (c) 2015 Rambler DS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RamblerModuleBetaInteractorInput.h"

@protocol RamblerModuleBetaInteractorOutput;

@interface RamblerModuleBetaInteractor : NSObject <RamblerModuleBetaInteractorInput>

@property (nonatomic, weak) id<RamblerModuleBetaInteractorOutput> output;

@end

